source "https://rubygems.org"
ruby "2.5.1"

gem "active_model_serializers", ">= 0.10.8"
gem "bunny"
gem "delayed_job_active_record"
gem "delayed_job"
gem "devise", ">= 4.5.0"
gem "discard"
gem "figaro"
gem "fog-google", ">= 1.7.0"
gem "font-awesome-rails", ">= 4.7.0.5"
gem "foreman"
gem "jwt"
gem "mutations"
gem "paperclip"
gem "pg"
gem "polymorphic_constraints"
gem "rack-attack"
gem "rack-cors"
gem "rails_12factor"
gem "rails", ">= 5.2.1"
gem "request_store"
gem "rollbar"
gem "scenic", ">= 1.5.0"
gem "secure_headers"
gem "skylight"
gem "tzinfo" # For validation of user selected timezone names
gem "valid_url"
gem "webpack-rails"
# Still working out the bugs. - RC 5 Jul 18
gem "rabbitmq_http_api_client"
gem "zero_downtime_migrations"

group :development, :test do
  gem "thin"
  gem "capybara", ">= 3.5.0"
  gem "codecov", require: false
  gem "database_cleaner"
  gem "factory_bot_rails", ">= 4.11.0"
  gem "faker"
  gem "hashdiff"
  gem "letter_opener"
  gem "lol_dba", ">= 2.1.6"
  gem "pry-rails"
  gem "pry"
  gem "rails-erd"
  gem "rspec-rails", ">= 3.8.0"
  gem "rspec"
  gem "selenium-webdriver"
  gem "simplecov"
  gem "smarf_doc", git: "https://github.com/RickCarlino/smarf_doc.git"
end

group :production do
  gem "passenger"
end
