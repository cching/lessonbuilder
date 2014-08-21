class RcategoriesController < ApplicationController
  # GET /rcategories
  # GET /rcategories.json
  def index
    @rcategories = Rcategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rcategories }
    end
  end

  # GET /rcategories/1
  # GET /rcategories/1.json
  def show
    @rcategory = Rcategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rcategory }
    end
  end

  # GET /rcategories/new
  # GET /rcategories/new.json
  def new
    @rcategory = Rcategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rcategory }
    end
  end

  # GET /rcategories/1/edit
  def edit
    @rcategory = Rcategory.find(params[:id])
  end

  # POST /rcategories
  # POST /rcategories.json
  def create
    @rcategory = Rcategory.new(params[:rcategory])

    respond_to do |format|
      if @rcategory.save
        format.html { redirect_to @rcategory, notice: 'Rcategory was successfully created.' }
        format.json { render json: @rcategory, status: :created, location: @rcategory }
      else
        format.html { render action: "new" }
        format.json { render json: @rcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rcategories/1
  # PUT /rcategories/1.json
  def update
    @rcategory = Rcategory.find(params[:id])

    respond_to do |format|
      if @rcategory.update_attributes(params[:rcategory])
        format.html { redirect_to @rcategory, notice: 'Rcategory was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rcategories/1
  # DELETE /rcategories/1.json
  def destroy
    @rcategory = Rcategory.find(params[:id])
    @rcategory.destroy

    respond_to do |format|
      format.html { redirect_to rcategories_url }
      format.json { head :no_content }
    end
  end
end
