ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "shoobphoto.herokuapp.com",
  :user_name            => "shoobtech@gmail.com",
  :password             => "shoob2420",
  :authentication       => "plain",
  :enable_starttls_auto => true
}