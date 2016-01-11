Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linkedin, ENV['linkedin_key'], ENV['linkedin_secret'], scope: 'r_basicprofile',
           fields: ['id']
end
