class XskillsController < ApplicationController
  # GET /xskills
  # GET /xskills.json
  def index
    @xskills = Xskill.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @xskills }
    end
  end

  # GET /xskills/1
  # GET /xskills/1.json
  def show
    @xskill = Xskill.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @xskill }
    end
  end

  # GET /xskills/new
  # GET /xskills/new.json
  def new
    @xskill = Xskill.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @xskill }
    end
  end

  # GET /xskills/1/edit
  def edit
    @xskill = Xskill.find(params[:id])
  end

  # POST /xskills
  # POST /xskills.json
    def create
      @select = Select.find(params[:select_id])
      @standard = Standard.find(params[:standard_id])
      @sskills = SelectSkill.where(:select_id => @select.id)
      @xskill = Xskill.new
      @xskill.standard_id = @standard.id
      @xskill.select_id = @select.id


      respond_to do |format|
        if @xskill.save
            @selects = SelectSkill.new
            @selects.select_id = @select.id
            @selects.xskill_id = @xskill.id
            @selects.save
            format.js

        else
          render :action => 'new'
        end
        end
      end

  # PUT /xskills/1
  # PUT /xskills/1.json
  def update
    @xskill = Xskill.find(params[:id])

    respond_to do |format|
      if @xskill.update_attributes(params[:xskill])
        format.html { redirect_to @xskill, notice: 'Xskill was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @xskill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /xskills/1
  # DELETE /xskills/1.json
  def destroy
    @xskill = Xskill.find(params[:id])
    @xskill.destroy

    respond_to do |format|
      format.html { redirect_to xskills_url }
      format.json { head :no_content }
    end
  end

  def select_skills
    @xskill = Xskill.find(params[:id])
    @select = Select.find(params[:select_id])
      @selects = @select.select_skills.new
      @selects.select_id = @select.id
      @selects.xskill_id = @xskill.id

      if @selects.save
      respond_to do |format|
        format.js
      end
      end
end

    def unselect_skills
    @xskill = Xskill.find(params[:id])
    @select = Select.find(params[:select_id])
      @selects = SelectSkill.where(:xskill_id => @xskill.id).where(:select_id => @select.id).last
      @selects.delete
      respond_to :js
    end


    def add
    @xskill = Xskill.find(params[:id])
    @select = Select.find(params[:select_id])
    
    @select.notes = @select.notes + "<br/>" +  @xskill.content
    @select.save
      respond_to :js
    end
end
