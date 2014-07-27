class XquestionsController < ApplicationController
    def create
      @select = Select.find(params[:select_id])
      @xquestion = @select.xquestions.build(params[:xquestion])
      respond_to do |format|
        if @xquestion.save
          
            format.js { render action: "create" }

        else
          render :action => 'new'
        end
        end
      end
  
      def new
        @select = Select.find(params[:select_id])
        @xquestion = @select.xquestions.build
        respond_to do |format|
          format.js
        end
      end
  
    def update
      @xquestion = Xquestion.find(params[:id])
      @select = Select.find(params[:select_id])
      
        if @clink.update_attributes(params[:clink])
          redirect_to edit_select_path(@select)
        else
          render :action => 'edit'
      end
    end
    
    def destroy
      @xquestion = Xquestion.find(params[:id])
      @select = Select.find(params[:select_id])
      @xquestion.destroy
      
      redirect_to edit_select_path(@select)
    end
    
    def edit
    @select = Select.find(params[:select_id])
    @standards = @select.standards.all
    @ids = @standards.map{|standard| standard.id}
    @xquestions = Xquestion.where(:standard_id => @ids)
    end
    
    def show
      @select = Select.find(params[:select_id])
      @xquestion = Xquestion.find(params[:id])
    end
    
    def index
    end
end
