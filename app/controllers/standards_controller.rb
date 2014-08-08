class StandardsController < ApplicationController
    
  def index
    @subject = Subject.all
    @subject2 = Subsubject.all
    @grade = Grade.all    
    respond_to do |format|
      format.js
      format.html
    end
  end

  def show
    @standard = Standard.find_by_standard_id(params[:id])
    @successive = Standard.where(:successive_standard_id => @standard.successive_standard_id).order("standard_id ASC")
    @successive_prev = Standard.where(:successive_standard_id => @standard.successive_standard_id).where("standard_id < ?", @standard.standard_id).order("standard_id ASC").last
    @successive_next = Standard.where(:successive_standard_id => @standard.successive_standard_id).where("standard_id > ?", @standard.standard_id).order("standard_id ASC").first
    @related = Standard.where(:similar_standard_id => @standard.similar_standard_id)
    @questions = @standard.questions.all
    @anchors = @standard.anchor_standards.all
    @icans = @standard.i_cans.all
    @skills = @standard.skills.all
    @strategies = @standard.strategies.all
    @links = @standard.links.all
    @vocabs = @standard.vocabs.all
    @aquestions = @standard.aquestions.all
    @grade = Grade.find(params[:grade_id])

    if params[:subject_id] != nil
      @subject = Subject.find(params[:subject_id])
    elsif params[:subject2_id] != nil
      @subject2 = Subsubject.find(params[:subject2_id])
    end
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

    respond_to do |format|
      format.js
      format.html
    end
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

  def hide
    @grade = Grade.find(params[:grade])

    if params[:subject] != nil
      @subject = Subject.find(params[:subject])  

    else
      @subject2 = Subsubject.find(params[:subsubject])
    end
    respond_to do |format|
      format.js
    end
  end
end