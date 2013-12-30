class CstrategiesController < ApplicationController
  
    def create
      @select = Select.find(params[:select_id])
      @cstrategy = @select.cstrategies.build(params[:cstrategy])
  
        if @cstrategy.save
          redirect_to select_path(@select)
        else
          render :action => 'new'
        end
      end

      def new
        @select = Select.find(params[:select_id])
        @cstrategy = @select.cstrategies.build
      end

    
    def update
      @cstrategy = Cstrategy.find(params[:id])
      @select = Select.find(params[:select_id])
      
      if @cstrategy.update_attributes(params[:cstrategy])
        redirect_to edit_select_path(@select)
      else
        render :action => 'edit'
      end

    end
    
    def destroy
      @cstrategy = Cstrategy.find(params[:id])
      @select = Select.find(params[:select_id])
      @cstrategy.destroy
      
      redirect_to edit_select_path(@select)
    end
    
    def edit
      @select = Select.find(params[:select_id])
      @cstrategy = Cstrategy.find(params[:id])
    end
    
    def show
      @select = Select.find(params[:select_id])
      @cstrategy = Cstrategy.find(params[:id])
    end
    
    def index
    end
    
end
