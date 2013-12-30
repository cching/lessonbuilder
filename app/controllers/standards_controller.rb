class StandardsController < ApplicationController
    
  def index
    @search = Standard.search(params[:q])
    @standards = @search.result.paginate(:page => params[:page], :per_page => 150)
    @select = Select.new
  end
  
  def show
    @standard = Standard.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @standard }
    end
  end
  
  def new
    @standard = Standard.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @standard }
    end
  end

  def edit
    @standard = Standard.find(params[:id])
  end

  def create
    @standard = Standard.new(params[:standard])

    respond_to do |format|
      if @standard.save
        format.html { redirect_to @standard, notice: 'Test was successfully created.' }
        format.json { render json: @standard, status: :created, location: @standard }
      else
        format.html { render action: "new" }
        format.json { render json: @standard.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @standard = Standard.find(params[:id])

    respond_to do |format|
      if @standard.update_attributes(params[:standard])
        format.html { redirect_to @standard, notice: 'The standard was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @standard.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @standard = Standard.find(params[:id])
    @standard.destroy

    respond_to do |format|
      format.html { redirect_to standards_url }
      format.json { head :no_content }
    end
  end
end