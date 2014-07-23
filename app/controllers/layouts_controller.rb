class LayoutsController < ApplicationController

  def new
    @select = Select.new

  end
  def create
    @select = current_user.selects.build(params[:select])

  if @select.save
    
        redirect_to lesson_steps_path(:select_id => @select.id)

  else
    render :new
  end
  end
end