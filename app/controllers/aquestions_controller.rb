class AquestionsController < ApplicationController
  # GET /aquestions
  # GET /aquestions.json
  def index
    @search = Aquestion.search(params[:q])
    @aquestions = @search.result.paginate(:page => params[:page], :per_page => 150)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @aquestions }
    end
  end

  # GET /aquestions/1
  # GET /aquestions/1.json
  def show
    @aquestion = Aquestion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @aquestion }
    end
  end

  # GET /aquestions/new
  # GET /aquestions/new.json
  def new
    @aquestion = Aquestion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @aquestion }
    end
  end

  # GET /aquestions/1/edit
  def edit
    @aquestion = Aquestion.find(params[:id])
  end

  # POST /aquestions
  # POST /aquestions.json
  def create
    @aquestion = Aquestion.new(params[:aquestion])

    respond_to do |format|
      if @aquestion.save
        format.html { redirect_to @aquestion, notice: 'Aquestion was successfully created.' }
        format.json { render json: @aquestion, status: :created, location: @aquestion }
      else
        format.html { render action: "new" }
        format.json { render json: @aquestion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /aquestions/1
  # PUT /aquestions/1.json
  def update
    @aquestion = Aquestion.find(params[:id])

    respond_to do |format|
      if @aquestion.update_attributes(params[:aquestion])
        format.html { redirect_to @aquestion, notice: 'Aquestion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @aquestion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aquestions/1
  # DELETE /aquestions/1.json
  def destroy
    @aquestion = Aquestion.find(params[:id])
    @aquestion.destroy

    respond_to do |format|
      format.html { redirect_to aquestions_url }
      format.json { head :no_content }
    end
  end
end
