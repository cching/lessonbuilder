class UserMailer < ActionMailer::Base
  default :from => 'shoobtech@gmail.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_share(form, total)
    @form = form
    @email = @form.email
    @name = @form.name
    @notes = @form.notes
    @total = total
    mail( :to => @email,
    :subject => "Your order receipt from the Shoobphoto catalog" )
  end

  def send_notice(form, total)
    @form = form
    @email = @form.email
    @name = @form.name
    @notes = @form.notes
    @total = total
    @sender = 'projects@shoobphoto.com'
    mail( :to => @sender,
    :subject => "Order receipt" )
  end
end

