class CstrategiesController < ApplicationController
  
    def create
      @select = Select.find(params[:select_id])
      @cstrategy = @select.cstrategies.build(params[:cstrategy])
    respond_to do |format|
        if @cstrategy.save
          
            format.js { render action: "create" }

        else
          render :action => 'new'
        end
        end
      end

      def new
        @select = Select.find(params[:select_id])
        @cstrategy = @select.cstrategies.build
        respond_to do |format|
          format.js
        end
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
