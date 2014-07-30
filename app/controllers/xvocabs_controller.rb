class XvocabsController < ApplicationController
  # GET /xvocabs
  # GET /xvocabs.json
  def index
    @xvocabs = Xvocab.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @xvocabs }
    end
  end

  # GET /xvocabs/1
  # GET /xvocabs/1.json
  def show
    @xvocab = Xvocab.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @xvocab }
    end
  end

  # GET /xvocabs/new
  # GET /xvocabs/new.json
  def new
    @xvocab = Xvocab.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @xvocab }
    end
  end

  # GET /xvocabs/1/edit
  def edit
    @xvocab = Xvocab.find(params[:id])
  end

  # POST /xvocabs
  # POST /xvocabs.json
  def create
    @xvocab = Xvocab.new(params[:xvocab])

    respond_to do |format|
      if @xvocab.save
        format.html { redirect_to @xvocab, notice: 'Xvocab was successfully created.' }
        format.json { render json: @xvocab, status: :created, location: @xvocab }
      else
        format.html { render action: "new" }
        format.json { render json: @xvocab.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /xvocabs/1
  # PUT /xvocabs/1.json
  def update
    @xvocab = Xvocab.find(params[:id])

    respond_to do |format|
      if @xvocab.update_attributes(params[:xvocab])
        format.html { redirect_to @xvocab, notice: 'Xvocab was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @xvocab.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /xvocabs/1
  # DELETE /xvocabs/1.json
  def destroy
    @xvocab = Xvocab.find(params[:id])
    @xvocab.destroy

    respond_to do |format|
      format.html { redirect_to xvocabs_url }
      format.json { head :no_content }
    end
  end

  def select_vocabs
    @xvocab = Xvocab.find(params[:id])
    @select = Select.find(params[:select_id])
      @selectv = @select.select_vocabs.new
      @selectv.select_id = @select.id
      @selectv.xvocab_id = @xvocab.id

      if @selectv.save
      respond_to do |format|
        format.js
      end
      end
end

    def unselect_vocabs
    @xvocab = Xvocab.find(params[:id])
    @select = Select.find(params[:select_id])
      @selectv = SelectVocab.where(:xvocab_id => @xvocab.id).where(:select_id => @select.id).last
      @selectv.delete
      respond_to :js
    end
end
