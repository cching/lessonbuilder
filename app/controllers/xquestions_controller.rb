class XquestionsController < ApplicationController
    def create
      @select = Select.find(params[:select_id])
      @standard = Standard.find(params[:standard_id])
      @squestions = SelectQuestion.where(:select_id => @select.id)
      @xquestion = Xquestion.new
      @xquestion.standard_id = @standard.id
      @xquestion.select_id = @select.id


      respond_to do |format|
        if @xquestion.save
            @selectq = SelectQuestion.new
            @selectq.select_id = @select.id
            @selectq.xquestion_id = @xquestion.id
            @selectq.save
            format.js

        else
          render :action => 'new'
        end
        end
      end
  
      def new
        @select = Select.find(params[:select_id])
        @standard = Standard.find(params[:standard_id])
        @squestions = SelectQuestion.where(:select_id => @select.id).last
        @xquestion = Xquestion.new
        respond_to do |format|
          format.js
        end
      end
  
    def update
      @select = Select.find(params[:id])
      
        if @select.update_attributes(params[:select])
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
    @xquestion = Xquestion.new
    end
    
    def show
      @select = Select.find(params[:select_id])
      @xquestion = Xquestion.find(params[:id])
    end
    
    def index
    end

    def select_questions
    @xquestion = Xquestion.find(params[:id])
    @select = Select.find(params[:select_id])
      @selectq = @select.select_questions.new
      @selectq.select_id = @select.id
      @selectq.xquestion_id = @xquestion.id

      if @selectq.save
      respond_to do |format|
        format.js
      end
      end
end

    def unselect_questions
    @xquestion = Xquestion.find(params[:id])
    @select = Select.find(params[:select_id])
      @selectq = SelectQuestion.where(:xquestion_id => @xquestion.id).where(:select_id => @select.id).last
      @selectq.delete
      respond_to :js
    end

  def sort
  params[:xquestion].each_with_index do |id, index|
    Xquestion.update_all({position: index+1}, {id: id})
  end
  render nothing: true
  end
end
