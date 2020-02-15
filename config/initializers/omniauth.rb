Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['182825779607221'], ENV['c3ee70733014685c038e230b85a80400'],
  scope: 'email', display: 'popup', local: 'ja_JP', info_fields: "id, name, gender"
end