class ResourcesController < ApplicationController
  # GET /resources
  # GET /resources.json
  def index
    @resources = Resource.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @resources }
    end
  end

  # GET /resources/1
  # GET /resources/1.json
  def show
    @resource = Resource.find(params[:id])
    @id = "https://docs.google.com/file/d/" + "#{@resource.google_url}" "/preview" 

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @resource }
    end
  end

  def gallery
    @attachment = Attachment.new
    @select = Select.find(params[:select_id])
    @attachment.select_id = @select.id
    @attachment.alternate = TRUE
    @attachment.save
    @resources = Resource.where(:gogle_url != nil).all
    respond_to do |format|
      format.js
    end
  end

  # GET /resources/new
  # GET /resources/new.json
  def new
    @resource = Resource.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @resource }
    end
  end

  # GET /resources/1/edit
  def edit
    @resource = Resource.find(params[:id])
  end

  # POST /resources
  # POST /resources.json
  def create
    @resource = Resource.new(params[:resource])

    respond_to do |format|
      if @resource.save
        format.html { redirect_to upload_resource_path(@resource) }
        format.json { render json: @resource, status: :created, location: @resource }
      else
        format.html { render action: "new" }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  def upload
    @resource = Resource.find(params[:id])

    case @resource.filetype_id 
      when 1
        @type = "application/pdf"
      when 2
        @type = "application/msword"
      when 3
        @type = "image/jpeg"
    end

     require './lib/resource_drive'
        file = Post::Drive.new(@resource, @type)
        file.update

        redirect_to resource_path(@resource)
  end

  # PUT /resources/1
  # PUT /resources/1.json
  def update
    @resource = Resource.find(params[:id])

    respond_to do |format|
      if @resource.update_attributes(params[:resource])
        format.html { redirect_to @resource, notice: 'Resource was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resources/1
  # DELETE /resources/1.json
  def destroy
    @resource = Resource.find(params[:id])
    @resource.destroy

    respond_to do |format|
      format.html { redirect_to resources_url }
      format.json { head :no_content }
    end
  end
end
