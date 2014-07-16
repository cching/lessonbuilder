class CaquestionsController < ApplicationController
  
    def create
      @select = Select.find(params[:select_id])
      @caquestion = @select.caquestions.build(params[:caquestion])
      respond_to do |format|
        if @caquestion.save
          
            format.js { render action: "create" }

        else
          render :action => 'new'
        end
        end
      end
  
      def new
        @select = Select.find(params[:select_id])
        @caquestion = @select.caquestions.build
        respond_to do |format|
          format.js
        end
      end
  
    def update
      @caquestion = Caquestion.find(params[:id])
      @select = Select.find(params[:select_id])
      
        if @caquestion.update_attributes(params[:caquestion])
          redirect_to edit_select_path(@select)
        else
          render :action => 'edit'
        end
    end
    
    def destroy
      @caquestion = Caquestion.find(params[:id])
      @select = Select.find(params[:select_id])
      @caquestion.destroy
      
      redirect_to edit_select_path(@select)
    end
    
    def edit
      @select = Select.find(params[:select_id])
      @caquestion = Caquestion.find(params[:id])
    end
    
    def show
      @select = Select.find(params[:select_id])
      @caquestion = Cqauestion.find(params[:id])
    end
    
    def index
    end
    
end