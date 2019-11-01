Mailjet.configure do |config|
  config.api_key = ENV.fetch('MAILJET_API_KEY')
  config.secret_key = ENV.fetch('MAILJET_SECRET_KEY')
  config.api_version = "v3.1"
  config.default_from = 'no-reply@thinkindianitr.club'
end
