class CvocabsController < ApplicationController
  
    def create
      @select = Select.find(params[:select_id])
      @cvocab = @select.cvocabs.build(params[:cvocab])
  
        if @cvocab.save
          redirect_to select_path(@select)
        else
          render :action => 'new'
        end
      end

      def new
        @select = Select.find(params[:select_id])
        @cvocab = @select.cvocabs.build
      end

    
    def update
      @cvocab = Cvocab.find(params[:id])
      @select = Select.find(params[:select_id])
      
      if @cvocab.update_attributes(params[:cvocab])
        redirect_to edit_select_path(@select)
      else
        render :action => 'edit'
      end

    end
    
    def destroy
      @cvocab = Cvocab.find(params[:id])
      @select = Select.find(params[:select_id])
      @cvocab.destroy
      
      redirect_to edit_select_path(@select)
    end
    
    def edit
      @select = Select.find(params[:select_id])
      @cvocab = Cvocab.find(params[:id])
    end
    
    def show
      @select = Select.find(params[:select_id])
      @cvocab = Cvocab.find(params[:id])
    end
    
    def index
    end
    
end
