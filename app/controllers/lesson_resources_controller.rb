class LessonResourcesController < ApplicationController
  
    def update
      @select = Select.find(params[:select_id])
      @resource = LessonResource.where(:select_id => @select.id).first
         respond_to do |format|
          if @resource.update_attributes(params[:lesson_resource])
          format.js { render action: "update" }
        end
        end
    end
    
    def edit
      @select = Select.find(params[:select_id])
      @resource = LessonResource.where(:select_id => @select.id).first
      respond_to do |format|
        format.js
      end
    end
    
end
