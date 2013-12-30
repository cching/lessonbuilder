class CquestionsController < ApplicationController
  
    def create
      @select = Select.find(params[:select_id])
      @cquestion = @select.cquestions.build(params[:cquestion])
    
        if @cquestion.save
          redirect_to select_path(@select)
        else
          render :action => 'new'
        end
      end
  
      def new
        @select = Select.find(params[:select_id])
        @cquestion = @select.cquestions.build

      end
  
    def update
      @cquestion = Cquestion.find(params[:id])
      @select = Select.find(params[:select_id])
      
        if @cquestion.update_attributes(params[:cquestion])
          redirect_to edit_select_path(@select)
        else
          render :action => 'edit'
        end
    end
    
    def destroy
      @cquestion = Cquestion.find(params[:id])
      @select = Select.find(params[:select_id])
      @cquestion.destroy
      
      redirect_to edit_select_path(@select)
    end
    
    def edit
      @select = Select.find(params[:select_id])
      @cquestion = Cquestion.find(params[:id])
    end
    
    def show
      @select = Select.find(params[:select_id])
      @cquestion = Cquestion.find(params[:id])
    end
    
    def index
    end
    
end