class SelectSkillsController < ApplicationController
  # GET /select_skills
  # GET /select_skills.json
  def index
    @select_skills = SelectSkill.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @select_skills }
    end
  end

  # GET /select_skills/1
  # GET /select_skills/1.json
  def show
    @select_skill = SelectSkill.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @select_skill }
    end
  end

  # GET /select_skills/new
  # GET /select_skills/new.json
  def new
    @select_skill = SelectSkill.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @select_skill }
    end
  end

  # GET /select_skills/1/edit
  def edit
    @select_skill = SelectSkill.find(params[:id])
  end

  # POST /select_skills
  # POST /select_skills.json
  def create
    @select_skill = SelectSkill.new(params[:select_skill])

    respond_to do |format|
      if @select_skill.save
        format.html { redirect_to @select_skill, notice: 'Select skill was successfully created.' }
        format.json { render json: @select_skill, status: :created, location: @select_skill }
      else
        format.html { render action: "new" }
        format.json { render json: @select_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /select_skills/1
  # PUT /select_skills/1.json
  def update
    @select_skill = SelectSkill.find(params[:id])

    respond_to do |format|
      if @select_skill.update_attributes(params[:select_skill])
        format.html { redirect_to @select_skill, notice: 'Select skill was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @select_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /select_skills/1
  # DELETE /select_skills/1.json
  def destroy
    @select_skill = SelectSkill.find(params[:id])
    @select_skill.destroy

    respond_to do |format|
      format.html { redirect_to select_skills_url }
      format.json { head :no_content }
    end
  end
end
