Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?

  # provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_SECRET"],

  provider :google_oauth2, "816926057493-0u2tdombq5fr9f1qsc2l360tkaf272q6.apps.googleusercontent.com", "Lov9eqymP5o6_Ew-3hfCR8nD",
    {
      name: "google",
      access_type: 'offline',
      scope: "email, profile, plus.me",
      prompt: "select_account",
      image_aspect_ratio: "square",
      image_size: 50
    }

 OmniAuth.config.on_failure = Proc.new do |env|
   SessionsController.action(:auth_failure).call(env)
 end
end

