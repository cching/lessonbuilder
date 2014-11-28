class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @select = Select.where(:user_id => @user)
    @selects = Select.where(:user_id => @user.id)
    @assessments = Assessment.where(:select_id => @selects).all
    @selects_by_date = @selects.group_by(&:date)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today

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

  def edit
    @user = User.find(params[:id])
  end
  
  def index
    @users = User.order(:name)
    respond_to do |format|
      format.html
      format.json { render json: @users.where("name like ?", "%#{params[:q]}%") }
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to tests_url }
      format.json { head :no_content }
    end
  end
  
    def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
