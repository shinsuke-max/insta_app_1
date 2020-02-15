Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['182825779607221'], ENV['283f280451c589b92efe99c598f8e9cf']
end