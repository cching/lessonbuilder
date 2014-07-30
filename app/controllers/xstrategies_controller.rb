class XstrategiesController < ApplicationController
  # GET /xstrategies
  # GET /xstrategies.json
  def index
    @xstrategies = Xstrategy.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @xstrategies }
    end
  end

  # GET /xstrategies/1
  # GET /xstrategies/1.json
  def show
    @xstrategy = Xstrategy.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @xstrategy }
    end
  end

  # GET /xstrategies/new
  # GET /xstrategies/new.json
  def new
    @xstrategy = Xstrategy.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @xstrategy }
    end
  end

  # GET /xstrategies/1/edit
  def edit
    @xstrategy = Xstrategy.find(params[:id])
  end

  # POST /xstrategies
  # POST /xstrategies.json
  def create
    @xstrategy = Xstrategy.new(params[:xstrategy])

    respond_to do |format|
      if @xstrategy.save
        format.html { redirect_to @xstrategy, notice: 'Xstrategy was successfully created.' }
        format.json { render json: @xstrategy, status: :created, location: @xstrategy }
      else
        format.html { render action: "new" }
        format.json { render json: @xstrategy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /xstrategies/1
  # PUT /xstrategies/1.json
  def update
    @xstrategy = Xstrategy.find(params[:id])

    respond_to do |format|
      if @xstrategy.update_attributes(params[:xstrategy])
        format.html { redirect_to @xstrategy, notice: 'Xstrategy was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @xstrategy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /xstrategies/1
  # DELETE /xstrategies/1.json
  def destroy
    @xstrategy = Xstrategy.find(params[:id])
    @xstrategy.destroy

    respond_to do |format|
      format.html { redirect_to xstrategies_url }
      format.json { head :no_content }
    end
  end

  def select_strategies
    @xstrategy = Xstrategy.find(params[:id])
    @select = Select.find(params[:select_id])
      @selects = @select.select_strategies.new
      @selects.select_id = @select.id
      @selects.xstrategy_id = @xstrategy.id

      if @selects.save
      respond_to do |format|
        format.js
      end
      end
end

    def unselect_strategies
    @xstrategy = Xstrategy.find(params[:id])
    @select = Select.find(params[:select_id])
      @selects = SelectStrategy.where(:xstrategy_id => @xstrategy.id).where(:select_id => @select.id).last
      @selects.delete
      respond_to :js
    end
end
