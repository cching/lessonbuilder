class ClinksController < ApplicationController
  
    def create
      @select = Select.find(params[:select_id])
      @clink = @select.clinks.build(params[:clink])
    
        if @clink.save
          redirect_to select_path(@select)
        else
          render :action => 'new'
        end
      end
  
      def new
        @select = Select.find(params[:select_id])
        @clink = @select.clinks.build
      end
  
    def update
      @clink = Clink.find(params[:id])
      @select = Select.find(params[:select_id])
      
        if @clink.update_attributes(params[:clink])
          redirect_to edit_select_path(@select)
        else
          render :action => 'edit'
      end
    end
    
    def destroy
      @clink = Clink.find(params[:id])
      @select = Select.find(params[:select_id])
      @clink.destroy
      
      redirect_to edit_select_path(@select)
    end
    
    def edit
      @select = Select.find(params[:select_id])
      @clink = Clink.find(params[:id])
    end
    
    def show
      @select = Select.find(params[:select_id])
      @clink = Clink.find(params[:id])
    end
    
    def index
    end
    
end
