class SelectLinksController < ApplicationController
  # GET /select_links
  # GET /select_links.json
  def index
    @select_links = SelectLink.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @select_links }
    end
  end

  # GET /select_links/1
  # GET /select_links/1.json
  def show
    @select_link = SelectLink.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @select_link }
    end
  end

  # GET /select_links/new
  # GET /select_links/new.json
  def new
    @select_link = SelectLink.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @select_link }
    end
  end

  # GET /select_links/1/edit
  def edit
    @select_link = SelectLink.find(params[:id])
  end

  # POST /select_links
  # POST /select_links.json
  def create
    @select_link = SelectLink.new(params[:select_link])

    respond_to do |format|
      if @select_link.save
        format.html { redirect_to @select_link, notice: 'Select link was successfully created.' }
        format.json { render json: @select_link, status: :created, location: @select_link }
      else
        format.html { render action: "new" }
        format.json { render json: @select_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /select_links/1
  # PUT /select_links/1.json
  def update
    @select_link = SelectLink.find(params[:id])

    respond_to do |format|
      if @select_link.update_attributes(params[:select_link])
        format.html { redirect_to @select_link, notice: 'Select link was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @select_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /select_links/1
  # DELETE /select_links/1.json
  def destroy
    @select_link = SelectLink.find(params[:id])
    @select_link.destroy

    respond_to do |format|
      format.html { redirect_to select_links_url }
      format.json { head :no_content }
    end
  end
end
