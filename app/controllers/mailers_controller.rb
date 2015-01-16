class MailersController < ApplicationController
	def new
		@mailer = Mailer.new
	end

	def create
    # Create the user from params
    @mailer = Mailer.new(params[:mailer])
    @select = Select.find(params[:select_id])
    @mailer.select_id = @select.id
    if @mailer.save
      # Deliver the signup email
      Share.send_share(@mailer).deliver
      flash[:notice] = "You have successfully shared your lesson with #{@mailer.email}"
      redirect_to :back
    else
      render :action => 'new'
    end
  end
end
