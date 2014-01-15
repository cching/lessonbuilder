class SelectStrategiesController < ApplicationController
  # GET /select_strategies
  # GET /select_strategies.json
  def index
    @select_strategies = SelectStrategy.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @select_strategies }
    end
  end

  # GET /select_strategies/1
  # GET /select_strategies/1.json
  def show
    @select_strategy = SelectStrategy.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @select_strategy }
    end
  end

  # GET /select_strategies/new
  # GET /select_strategies/new.json
  def new
    @select_strategy = SelectStrategy.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @select_strategy }
    end
  end

  # GET /select_strategies/1/edit
  def edit
    @select_strategy = SelectStrategy.find(params[:id])
  end

  # POST /select_strategies
  # POST /select_strategies.json
  def create
    @select_strategy = SelectStrategy.new(params[:select_strategy])

    respond_to do |format|
      if @select_strategy.save
        format.html { redirect_to @select_strategy, notice: 'Select strategy was successfully created.' }
        format.json { render json: @select_strategy, status: :created, location: @select_strategy }
      else
        format.html { render action: "new" }
        format.json { render json: @select_strategy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /select_strategies/1
  # PUT /select_strategies/1.json
  def update
    @select_strategy = SelectStrategy.find(params[:id])

    respond_to do |format|
      if @select_strategy.update_attributes(params[:select_strategy])
        format.html { redirect_to @select_strategy, notice: 'Select strategy was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @select_strategy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /select_strategies/1
  # DELETE /select_strategies/1.json
  def destroy
    @select_strategy = SelectStrategy.find(params[:id])
    @select_strategy.destroy

    respond_to do |format|
      format.html { redirect_to select_strategies_url }
      format.json { head :no_content }
    end
  end
end
