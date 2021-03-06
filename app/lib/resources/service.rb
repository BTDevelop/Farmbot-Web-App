module Resources
  class Service
    MQTT_CHAN = "from_api"
    def self.ok(uuid)
      { kind: "rpc_ok", args: { label: uuid } }.to_json
    end

    def self.rpc_err(uuid, error)
      {
        kind: "rpc_error",
        args: { label: uuid },
        body: (error
        .errors
        .values
        .map { |err| { kind: "explanation", args: { message: err.message }} })
      }.to_json
    end

    def self.step1(delivery_info, body) # Returns params or nil
      PreProcessor.from_amqp(delivery_info, body)
    rescue Mutations::ValidationException => q
      Rollbar.error(q)
      raw_chan = delivery_info&.routing_key&.split(".") || []
      id       = raw_chan[1]&.gsub("device_", "")&.to_i
      uuid     = (raw_chan.last || "NONE")
      Transport.current.amqp_send(rpc_err(uuid, q), id, MQTT_CHAN) if id
      nil
    end

    def self.step2(params)
      puts params if Rails.env.production?
      Job.run!(params)
      uuid   = (params[:uuid] || "NONE")
      dev    = params[:device]

      dev.auto_sync_transaction do
        Transport.current.amqp_send(ok(uuid), dev.id, MQTT_CHAN)
      end
    rescue Mutations::ValidationException => q
      Rollbar.error(q)
      device = params.fetch(:device)
      uuid   = params.fetch(:uuid)
      errors = q.errors.values.map do |err|
        { kind: "explanation", args: { message: err.message }}
      end
      message = { kind: "rpc_error",
                  args: { label: uuid },
                  body: errors }.to_json
      Transport.current.amqp_send(message, device.id, MQTT_CHAN)
    end

    def self.process(delivery_info, body)
      params = step1(delivery_info, body)
      params && step2(params)
    end
  end # Service
end # Resources
