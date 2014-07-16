class CskillsController < ApplicationController
  
    def create
      @select = Select.find(params[:select_id])
      @cskill = @select.cskills.build(params[:cskill])
      respond_to do |format|
        if @cskill.save
          
            format.js { render action: "create" }

        else
          render :action => 'new'
        end
        end
    end
    
    def new
      @select = Select.find(params[:select_id])
      @cskill = @select.cskills.build
        respond_to do |format|
          format.js
        end
    end
    
    def update
      @select = Select.find(params[:select_id])
      @cskill = Cskill.find(params[:id])
      
        if @cskill.update_attributes(params[:cskill])
          redirect_to edit_select_path(@select)
        else
          render :action => 'edit'
        end
    end
    
    def destroy
      @cskill = Cskill.find(params[:id])
      @select = Select.find(params[:select_id])
      @cskill.destroy
      
      redirect_to edit_select_path(@select)
    end
    
    def edit
      @select = Select.find(params[:select_id])
      @cskill = Cskill.find(params[:id])
    end
    
    def show
      @select = Select.find(params[:select_id])
      @cskill = Cskill.find(params[:id])
    end
    
    def index
    end
    
end
