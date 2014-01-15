class SelectVocabsController < ApplicationController
  # GET /select_vocabs
  # GET /select_vocabs.json
  def index
    @select_vocabs = SelectVocab.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @select_vocabs }
    end
  end

  # GET /select_vocabs/1
  # GET /select_vocabs/1.json
  def show
    @select_vocab = SelectVocab.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @select_vocab }
    end
  end

  # GET /select_vocabs/new
  # GET /select_vocabs/new.json
  def new
    @select_vocab = SelectVocab.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @select_vocab }
    end
  end

  # GET /select_vocabs/1/edit
  def edit
    @select_vocab = SelectVocab.find(params[:id])
  end

  # POST /select_vocabs
  # POST /select_vocabs.json
  def create
    @select_vocab = SelectVocab.new(params[:select_vocab])

    respond_to do |format|
      if @select_vocab.save
        format.html { redirect_to @select_vocab, notice: 'Select vocab was successfully created.' }
        format.json { render json: @select_vocab, status: :created, location: @select_vocab }
      else
        format.html { render action: "new" }
        format.json { render json: @select_vocab.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /select_vocabs/1
  # PUT /select_vocabs/1.json
  def update
    @select_vocab = SelectVocab.find(params[:id])

    respond_to do |format|
      if @select_vocab.update_attributes(params[:select_vocab])
        format.html { redirect_to @select_vocab, notice: 'Select vocab was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @select_vocab.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /select_vocabs/1
  # DELETE /select_vocabs/1.json
  def destroy
    @select_vocab = SelectVocab.find(params[:id])
    @select_vocab.destroy

    respond_to do |format|
      format.html { redirect_to select_vocabs_url }
      format.json { head :no_content }
    end
  end
end
