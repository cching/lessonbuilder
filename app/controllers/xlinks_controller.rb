class XlinksController < ApplicationController
  # GET /xlinks
  # GET /xlinks.json
  def index
    @xlinks = Xlink.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @xlinks }
    end
  end

  # GET /xlinks/1
  # GET /xlinks/1.json
  def show
    @xlink = Xlink.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @xlink }
    end
  end

  # GET /xlinks/new
  # GET /xlinks/new.json
  def new
    @xlink = Xlink.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @xlink }
    end
  end

  # GET /xlinks/1/edit
  def edit
    @xlink = Xlink.find(params[:id])
  end

  # POST /xlinks
  # POST /xlinks.json
  def create
    @xlink = Xlink.new(params[:xlink])

    respond_to do |format|
      if @xlink.save
        format.html { redirect_to @xlink, notice: 'Xlink was successfully created.' }
        format.json { render json: @xlink, status: :created, location: @xlink }
      else
        format.html { render action: "new" }
        format.json { render json: @xlink.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /xlinks/1
  # PUT /xlinks/1.json
  def update
    @xlink = Xlink.find(params[:id])

    respond_to do |format|
      if @xlink.update_attributes(params[:xlink])
        format.html { redirect_to @xlink, notice: 'Xlink was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @xlink.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /xlinks/1
  # DELETE /xlinks/1.json
  def destroy
    @xlink = Xlink.find(params[:id])
    @xlink.destroy

    respond_to do |format|
      format.html { redirect_to xlinks_url }
      format.json { head :no_content }
    end
  end
end
