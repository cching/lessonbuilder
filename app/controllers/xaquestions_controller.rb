class XaquestionsController < ApplicationController
    def create
      @select = Select.find(params[:select_id])
      @standard = Standard.find(params[:standard_id])
      @saquestions = SelectAquestion.where(:select_id => @select.id)
      @xaquestion = Xaquestion.new
      @xaquestion.standard_id = @standard.id
      @xaquestion.select_id = @select.id


      respond_to do |format|
        if @xaquestion.save
            @selectq = SelectAquestion.new
            @selectq.select_id = @select.id
            @selectq.xaquestion_id = @xaquestion.id
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
        @saquestions = SelectAquestion.where(:select_id => @select.id).last
        @xaquestion = Xaquestion.new
        respond_to do |format|
          format.js
        end
      end
  
    def update
    @xaquestion = Xaquestion.find(params[:id])

    respond_to do |format|
      if @xaquestion.update_attributes(params[:xaquestion])
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @xaquestion.errors, status: :unprocessable_entity }
      end
    end
  end
    
    def destroy
      @xaquestion = Xaquestion.find(params[:id])
      @select = Select.find(params[:select_id])
      @xaquestion.destroy
      
      redirect_to edit_select_path(@select)
    end
    
    def edit
    @select = Select.find(params[:select_id])
    @standards = @select.standards.all
    @ids = @standards.map{|standard| standard.id}
    @xaquestion = Xaquestion.new
    end
    
    def show
      @select = Select.find(params[:select_id])
      @xaquestion = Xaquestion.find(params[:id])
    end
    
    def index
    end

    def select_aquestions
    @xaquestion = Xaquestion.find(params[:id])
    @select = Select.find(params[:select_id])
      @selectq = @select.select_aquestions.new
      @selectq.select_id = @select.id
      @selectq.xaquestion_id = @xaquestion.id

      if @selectq.save
      respond_to do |format|
        format.js
      end
      end
end

    def unselect_aquestions
    @xaquestion = Xaquestion.find(params[:id])
    @select = Select.find(params[:select_id])
      @selectq = SelectAquestion.where(:xaquestion_id => @xaquestion.id).where(:select_id => @select.id).last
      @selectq.delete
      respond_to :js
    end
end
