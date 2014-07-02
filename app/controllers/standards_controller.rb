class StandardsController < ApplicationController
    
  def index
    @search = Standard.search(params[:q])
    @standards = @search.result.paginate(:page => params[:page], :per_page => 10)
    
    respond_to do |format|
      format.js
      format.html
    end
  end
  
  def show
    @standard = Standard.find_by_standard_id(params[:id])
    @successive = Standard.where(:successive_standard_id => @standard.successive_standard_id)
    @related = Standard.where(:similar_standard_id => @standard.similar_standard_id)
    @questions = @standard.questions.all
    @anchors = @standard.anchor_standards.all
    @icans = @standard.i_cans.all
    @skills = @standard.skills.all
    @strategies = @standard.strategies.all
    @links = @standard.links.all
    @vocabs = @standard.vocabs.all
    @aquestions = @standard.aquestions.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @standard }
      format.js
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
    @standard = Standard.find_by_standard_id(params[:id])
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
    @standard = Standard.find_by_standard_id(params[:id])

    respond_to do |format|
      if @standard.update_attributes(params[:standard])
        format.html { redirect_to standards_path, notice: 'The standard was successfully updated.' }
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