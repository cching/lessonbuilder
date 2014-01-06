class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @select = Select.where(:user_id => @user)
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def index
    @users = User.all
  end
  
  def destroy
    @User = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to tests_url }
      format.json { head :no_content }
    end
  end
  
end
