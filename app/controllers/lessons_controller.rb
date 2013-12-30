class LessonsController < ApplicationController
  
  def search
    @search = Standard.search(params[:q])
    @standards = @search.result.paginate(:page => params[:page], :per_page => 150)
  end
  
  def create
    @search = Select.search(params[:q])
    @selects = @search.result.paginate(:page => params[:page], :per_page => 30)
    @lesson = current_user.lessons.build(params[:lesson])

      if @lesson.save
        redirect_to lessons_path
      else
        render :action => 'new'
    end
  end
  
  def new
    @lesson = Lesson.new
  end
  
end
