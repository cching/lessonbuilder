class SelectAquestionsController < ApplicationController
  # GET /select_aquestions
  # GET /select_aquestions.json
  def index
    @select_aquestions = SelectAquestion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @select_aquestions }
    end
  end

  # GET /select_aquestions/1
  # GET /select_aquestions/1.json
  def show
    @select_aquestion = SelectAquestion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @select_aquestion }
    end
  end

  # GET /select_aquestions/new
  # GET /select_aquestions/new.json
  def new
    @select_aquestion = SelectAquestion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @select_aquestion }
    end
  end

  # GET /select_aquestions/1/edit
  def edit
    @select_aquestion = SelectAquestion.find(params[:id])
  end

  # POST /select_aquestions
  # POST /select_aquestions.json
  def create
    @select_aquestion = SelectAquestion.new(params[:select_aquestion])

    respond_to do |format|
      if @select_aquestion.save
        format.html { redirect_to @select_aquestion, notice: 'Select aquestion was successfully created.' }
        format.json { render json: @select_aquestion, status: :created, location: @select_aquestion }
      else
        format.html { render action: "new" }
        format.json { render json: @select_aquestion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /select_aquestions/1
  # PUT /select_aquestions/1.json
  def update
    @select_aquestion = SelectAquestion.find(params[:id])

    respond_to do |format|
      if @select_aquestion.update_attributes(params[:select_aquestion])
        format.html { redirect_to @select_aquestion, notice: 'Select aquestion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @select_aquestion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /select_aquestions/1
  # DELETE /select_aquestions/1.json
  def destroy
    @select_aquestion = SelectAquestion.find(params[:id])
    @select_aquestion.destroy

    respond_to do |format|
      format.html { redirect_to select_aquestions_url }
      format.json { head :no_content }
    end
  end
end
