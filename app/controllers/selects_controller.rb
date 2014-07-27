class SelectsController < ApplicationController

  def index
    @search = Select.search(params[:q])
    @selects = @search.result.paginate(:page => params[:page], :per_page => 30)
  end

  def grade0
    @search = Select.search(params[:q])
    @selects0 = @search.result.includes(:grades).where(:grades => {:id => 1}).paginate(:page => params[:page], :per_page => 30)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def grade1
    @search = Select.search(params[:q])
    @selects1 = @search.result.includes(:grades).where(:grades => {:id => 2}).paginate(:page => params[:page], :per_page => 30)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def grade2
    @search = Select.search(params[:q])
    @selects2 = @search.result.includes(:grades).where(:grades => {:id => 3}).paginate(:page => params[:page], :per_page => 30)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def grade3
    @search = Select.search(params[:q])
    @selects3 = @search.result.includes(:grades).where(:grades => {:id => 4}).paginate(:page => params[:page], :per_page => 30)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def grade4
    @search = Select.search(params[:q])
    @selects4 = @search.result.includes(:grades).where(:grades => {:id => 5}).paginate(:page => params[:page], :per_page => 30)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def grade5
    @search = Select.search(params[:q])
    @selects5 = @search.result.includes(:grades).where(:grades => {:id => 6}).paginate(:page => params[:page], :per_page => 30)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def grade6
    @search = Select.search(params[:q])
    @selects6 = @search.result.includes(:grades).where(:grades => {:id => 7}).paginate(:page => params[:page], :per_page => 30)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def grade7
    @search = Select.search(params[:q])
    @selects7 = @search.result.includes(:grades).where(:grades => {:id => 8}).paginate(:page => params[:page], :per_page => 30)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def grade8
    @search = Select.search(params[:q])
    @selects8 = @search.result.includes(:grades).where(:grades => {:id => 9}).paginate(:page => params[:page], :per_page => 30)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @select = Select.find(params[:id])
    @standard = @select.standards.first
    @standards = @select.standards.all
    @questions = @select.questions.all
    respond_to do |format|
      format.html
      format.pdf do
        pdf = SelectPdf.new(@select)
        send_data pdf.render, filename: "#{@select.name}",
                              type: "application/pdf"

      end
    end
  end

  def new
    @select = Select.new

  end

  def edit
    @select = Select.find(params[:id])
    @standards = @select.standards.all
    @ids = @standards.map{|standard| standard.id}
    @xquestions = Xquestion.where(:standard_id => @ids).all
    respond_to do |format|
      format.js
    end
  end

  def create
    @select = current_user.selects.build(params[:select])
    @plan = Plan.where(:district_id => current_user.district_id).last
    @resource = LessonResource.new
    if @select.save
    @plan.headers.where(:initiate => false).each do |header|
    header2 = header.dup
    header2.plan_id = 0
    header2.select_id = @select.id
    header2.initiate = true
    header2.save
    @resource.select_id = @select.id
    @resource.save
    end
    redirect_to lesson_steps_path(:select_id => @select.id)

  else
    render :new
  end
  end
  
  def update
    @select = Select.find(params[:id])

    respond_to do |format|

      if @select.update_attributes(params[:select])
        format.json { respond_with_bip(@select) }
        format.html { redirect_to @select, notice: 'Click on the resources to edit' }

      else
        format.html { render action: "edit" }
        format.json { respond_with_bip(@select) }
      end
    end
  end

  def destroy
    @select = Select.find(params[:id])
    @select.destroy
    @user = current_user

    respond_to do |format|
      format.html { redirect_to @user }
      format.json { head :no_content }
    end
  end

end
