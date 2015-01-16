class Share < ActionMailer::Base
  default :from => 'shoobtech@gmail.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_share(mailer)
    @mailer = mailer
    @email = @mailer.email
    @url_edit = 'https://docs.google.com/document/d/' + @mailer.select.resource_id
    @select = @mailer.select
    mail( :to => @email,
    :subject => "#{@select.user.name} has shared a lesson with you" )
  end
end
