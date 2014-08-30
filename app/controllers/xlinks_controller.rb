
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
      format.js
    end
  end

  # GET /xlinks/1/edit
  def edit
    @xlink = Xlink.find(params[:id])
  end

  # POST /xlinks
  # POST /xlinks.json
  def create
      @select = Select.find(params[:select_id])
      @standard = Standard.find(params[:standard_id])
      @slinks = SelectLink.where(:select_id => @select.id)
      @xlink = Xlink.new
      @xlink.standard_id = @standard.id
      @xlink.select_id = @select.id


      respond_to do |format|
        if @xlink.save
            @selectl = SelectLink.new
            @selectl.select_id = @select.id
            @selectl.xlink_id = @xlink.id
            @selectl.save
            format.js

        else
          render :action => 'new'
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

  def select_links
    @xlink = Xlink.find(params[:id])
    @select = Select.find(params[:select_id])
      @selectl = @select.select_links.new
      @selectl.select_id = @select.id
      @selectl.xlink_id = @xlink.id

      if @selectl.save
      respond_to do |format|
        format.js
      end
      end
end

    def unselect_links
    @xlink = Xlink.find(params[:id])
    @select = Select.find(params[:select_id])
      @selectl = SelectLink.where(:xlink_id => @xlink.id).where(:select_id => @select.id).last
      @selectl.delete
      respond_to :js
    end

    def add
    @xlink = Xlink.find(params[:id])
    @select = Select.find(params[:select_id])
    
    @select.notes = @select.notes + "<br/>" +  @xlink.comment + "<br/>" + @xlink.link
    @select.save
      respond_to :js
    end
end
