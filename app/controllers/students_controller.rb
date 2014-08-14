class StudentsController < ApplicationController
	def index
		@user = User.find(params[:user_id])
		@students = @user.students.all
    respond_to do |format|
      format.js
      format.html
    end
	end

	def new
		@user = User.find(params[:user_id])
		@student = @user.students.build
		respond_to do |format|
			format.js
			format.html
		end
	end

	def create
      @user = User.find(params[:user_id])
      @student = Student.new
      @student.user_id = @user.id
      @student.save
        respond_to do |format|
          format.js
        end
     
      end
    
    def update
      @student = Student.find(params[:id])
      
        if @student.update_attributes(params[:student])
          redirect_to :back
        else
          render :action => 'edit'
        end
    end
    
    def destroy
      @student = Student.find(params[:id])
      @user = User.find(params[:user_id])
      @student.destroy
      
      redirect_to edit_select_path(@select)
    end
    
    def edit
      @user = User.find(params[:user_id])
      @student = Student.find(params[:id])
    end
    
    def show
      @user = User.find(params[:user_id])
      @student = Student.find(params[:id])
    end
end