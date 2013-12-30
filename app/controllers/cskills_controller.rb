class CskillsController < ApplicationController
  
    def create
      @select = Select.find(params[:select_id])
      @cskill = @select.cskills.build(params[:cskill])
      
        if @cskill.save
          redirect_to select_path(@select)
        else
          render :action => 'new'
        end
    end
    
    def new
      @select = Select.find(params[:select_id])
      @cskill = @select.cskills.build
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
