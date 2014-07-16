class ClinksController < ApplicationController
  
    def create
      @select = Select.find(params[:select_id])
      @clink = @select.clinks.build(params[:clink])
      respond_to do |format|
        if @clink.save
          
            format.js { render action: "create" }

        else
          render :action => 'new'
        end
        end
      end
  
      def new
        @select = Select.find(params[:select_id])
        @clink = @select.clinks.build
        respond_to do |format|
          format.js
        end
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
