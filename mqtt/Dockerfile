FROM rabbitmq:3.11.17
ADD ./rabbitmq.conf /etc/rabbitmq/
RUN rabbitmq-plugins enable --offline \
  rabbitmq_auth_backend_http \
  rabbitmq_management \
  rabbitmq_mqtt \
  rabbitmq_auth_backend_cache \
  rabbitmq_web_mqtt
CMD ["rabbitmq-server"]
