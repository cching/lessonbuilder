ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :user_name            => "shoobtech@gmail.com",
  :password             => "shoob2420",
  :authentication       => "plain",
  :enable_starttls_auto => true
}
