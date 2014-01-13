class LessonplansController < ApplicationController
  # GET /lessonplans
  # GET /lessonplans.json
  def index
    @lessonplans = Lessonplan.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lessonplans }
    end
  end

  # GET /lessonplans/1
  # GET /lessonplans/1.json
  def show
    @lessonplan = Lessonplan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lessonplan }
    end
  end

  # GET /lessonplans/new
  # GET /lessonplans/new.json
  def new
    @lessonplan = Lessonplan.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lessonplan }
    end
  end

  # GET /lessonplans/1/edit
  def edit
    @lessonplan = Lessonplan.find(params[:id])
  end

  # POST /lessonplans
  # POST /lessonplans.json
  def create
    @lessonplan = Lessonplan.new(params[:lessonplan])

    respond_to do |format|
      if @lessonplan.save
        format.html { redirect_to @lessonplan, notice: 'Lessonplan was successfully created.' }
        format.json { render json: @lessonplan, status: :created, location: @lessonplan }
      else
        format.html { render action: "new" }
        format.json { render json: @lessonplan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lessonplans/1
  # PUT /lessonplans/1.json
  def update
    @lessonplan = Lessonplan.find(params[:id])

    respond_to do |format|
      if @lessonplan.update_attributes(params[:lessonplan])
        format.html { redirect_to @lessonplan, notice: 'Lessonplan was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lessonplan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lessonplans/1
  # DELETE /lessonplans/1.json
  def destroy
    @lessonplan = Lessonplan.find(params[:id])
    @lessonplan.destroy

    respond_to do |format|
      format.html { redirect_to lessonplans_url }
      format.json { head :no_content }
    end
  end
end
