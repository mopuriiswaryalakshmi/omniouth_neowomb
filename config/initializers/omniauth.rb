OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['424183687961160'], ENV['212bc9ec72128cd15c00671544575bf8']
end


#424183687961160
#212bc9ec72128cd15c00671544575bf8
#provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET']