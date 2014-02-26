# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Plumhire::Application.initialize!

# Redis Cloud
if ENV["REDISCLOUD_URL"]
    uri = URI.parse(ENV["REDISCLOUD_URL"])
    $redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
end

# SendGrid
ActionMailer::Base.default_url_options = { host: ENV["domain"] }
ActionMailer::Base.smtp_settings = {
  user_name:            ENV["sendgrid_email_username"],
  password:             ENV["sendgrid_email_password"],
  domain:               ENV["domain"],
  address:              "smtp.sendgrid.net",
  port:                 587,
  authentication:       :plain,
  enable_starttls_auto: true
}
