class AttachmentsController < ApplicationController
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
    @attachment = Attachment.new
    @select = Select.find(params[:select_id])
    @attachment.select_id = @select.id
    @attachment.file_type = params[:file_type].to_s
    @attachment.save

    respond_to do |format|
      format.js # new.html.erb
      format.json { render json: @attachment }
    end
  end

  # POST /aquestions
  # POST /aquestions.json
  def create
    @attachment = Attachment.create( params[:attachment] )
    @select = Select.where(:select_id => @attachment.select_id).last
    respond_to do |format|
      if @attachment.save
      else
        format.html { render action: "new" }
        format.json { render json: @aquestion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /aquestions/1
  # PUT /aquestions/1.json
  def update
    @attachment = Attachment.find(params[:id])
    @select = Select.where(:id => @attachment.select_id).last

    respond_to do |format|
      if @attachment.update_attributes(params[:attachment])
        
    		format.html { redirect_to upload_attachment_path(@attachment) }
      else
        format.html { render action: "edit" }
        format.json { render json: @aquestion.errors, status: :unprocessable_entity }
      end
    end
  end

  def upload 
    @attachment = Attachment.find(params[:id])
    @select = Select.where(:id => @attachment.select_id).last
    Dir.mkdir(File.join(Rails.root, 'tmp'))

    if @attachment.file_type == 'image'
      require './lib/attachment_image'
    elsif @attachment.file_type == 'mp3'
      require './lib/attachment_mp3'
    elsif @attachment.file_type == 'doc'
      require './lib/attachment_doc'
    elsif @attachment.file_type == 'pdf'
      require './lib/attachment_pdf'
    end
        file = Post::Drive.new(@select, @attachment)
        file.update
    redirect_to :back
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
