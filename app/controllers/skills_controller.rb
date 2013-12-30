class SkillsController < ApplicationController
  # GET /skills
  # GET /skills.json
  def index
    @search = Skill.search(params[:q])
    @skills = @search.result.paginate(:page => params[:page], :per_page => 150)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @skills }
    end
  end

  # GET /skills/1
  # GET /skills/1.json
  def show
    @skill = skill.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @skill }
    end
  end

  # GET /skills/new
  # GET /skills/new.json
  def new
    @skill = skill.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @skill }
    end
  end

  # GET /skills/1/edit
  def edit
    @skill = skill.find(params[:id])
  end

  # POST /skills
  # POST /skills.json
  def create
    @skill = skill.new(params[:skill])

    respond_to do |format|
      if @skill.save
        format.html { redirect_to @skill, notice: 'skill was successfully created.' }
        format.json { render json: @skill, status: :created, location: @skill }
      else
        format.html { render action: "new" }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /skills/1
  # PUT /skills/1.json
  def update
    @skill= Skill.find(params[:id])

    respond_to do |format|
      if @skill.update_attributes(params[:skill])
        format.html { redirect_to @skill, notice: 'SKill was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skills/1
  # DELETE /skills/1.json
  def destroy
    @skill = skill.find(params[:id])
    @skill.destroy

    respond_to do |format|
      format.html { redirect_to skills_url }
      format.json { head :no_content }
    end
  end
end
