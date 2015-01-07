class SelectsController < ApplicationController

  def index
    @search = Select.search(params[:q])
    @selects = @search.result.paginate(:page => params[:page], :per_page => 30).where(:name != "")
  end

  def show
    @select = Select.find(params[:id])
    @standards = @select.standards.all
    @url_edit = 'https://docs.google.com/document/d/' + @select.resource_id + '/edit?usp=sharing&output=embed'
    @url = 'https://docs.google.com/document/d/' + @select.resource_id 

    if SelectUser.where(:user_id => current_user.id).where(:check => false).where(:select_id => @select.id).any?
      SelectUser.where(:user_id => current_user.id).where(:check => false).where(:select_id => @select.id).each do |invite|
        invite.check = true
        invite.save
      end
    end
    
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

  def update
    @select = Select.find(params[:id])
     @select.update_attributes(params[:select])
     respond_to do |format|
        format.js {render layout: false}
      end

    
    end

  def edit
    @select = Select.find(params[:select_id])

    respond_to do |format|
      format.js
    end
  end

  def post_questions
    @select = Select.find(params[:id])
    @questions = @select.xquestions.all

    require './lib/post_drive'
    file = Post::Mass.new(@select)
    file.post_question

  end

  def post_qs
    @select = Select.find(params[:id])
    @question = Xquestion.find(params[:xquestion_id])

    require './lib/post_drive'
    file = Post::Individual.new(@select, @question)
    file.post_individual
  
    render :nothing => true
  end

  def post_vocabs
    @select = Select.find(params[:id])
    @vocabs = @select.xvocabs.all

    require './lib/post_drive'
    file = Post::Mass.new(@select)
    file.post_vocab 

  end

  def post_vs
    @select = Select.find(params[:id])
    @vocab = Xvocab.find(params[:xvocab_id])

    require './lib/post_drive'
    file = Post::Individual.new(@select, @vocab)
    file.post_individual_vocab
  
    render :nothing => true
  end

  def post_skills
    @select = Select.find(params[:id])
    @skills = @select.xskills.all

    require './lib/post_drive'
    file = Post::Mass.new(@select)
    file.post_skill 

  end

  def post_ss
    @select = Select.find(params[:id])
    @skill = Xskill.find(params[:xskill_id])

    require './lib/post_drive'
    file = Post::Individual.new(@select, @skill)
    file.post_individual
  
    render :nothing => true
  end

  def post_links
    @select = Select.find(params[:id])
    @links = @select.xlinks.all

    require './lib/post_drive'
    file = Post::Mass.new(@select)
    file.post_link

  end

  def post_ls
    @select = Select.find(params[:id])
    @link = Xlink.find(params[:xlink_id])

    require './lib/post_drive'
    file = Post::Individual.new(@select, @link)
    file.post_individual_link
  
    render :nothing => true
  end

  def post_aquestions
    @select = Select.find(params[:id])
    @aquestions = @select.xaquestions.all

    require './lib/post_drive'
    file = Post::Mass.new(@select)
    file.post_aquestion 

  end

  def post_aqs
    @select = Select.find(params[:id])
    @aquestion = Xaquestion.find(params[:xaquestion_id])

    require './lib/post_drive'
    file = Post::Individual.new(@select, @aquestion)
    file.post_individual
  
    render :nothing => true
  end

  def create
    @select = current_user.selects.build(params[:select])
    @select.user_id = current_user.id
    @plan = Plan.where(:district_id => current_user.district_id).last
    if @select.save

    require './lib/google_drive'
    file = Drive::GoogleDriveNew.new(@select)
    file.upload

    @plan.headers.where(:initiate => false).each do |header|
    header2 = header.dup
    header2.plan_id = 0
    header2.select_id = @select.id
    header2.initiate = true
    header2.save
    end
    redirect_to lesson_steps_path(:select_id => @select.id)

  else
    render :new
  end
  end
  

  def destroy
    @select = Select.find(params[:id])
    if @select.user_id == current_user.id || current_user.try(:admin)
    
    @select.destroy
    @user = current_user

    respond_to do |format|
      format.html { redirect_to @user }
      format.js
      format.json { head :no_content }
    end
  end
  end

  def grade0
    @search = Select.search(params[:q])
    @selects0 = @search.result.includes(:grades).where(:grades => {:id => 1}).where(:name != nil)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def grade1
    @search = Select.search(params[:q])
    @selects1 = @search.result.includes(:grades).where(:grades => {:id => 2}).where(:name != nil)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def grade2
    @search = Select.search(params[:q])
    @selects2 = @search.result.includes(:grades).where(:grades => {:id => 3}).where(:name != nil)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def grade3
    @search = Select.search(params[:q])
    @selects3 = @search.result.includes(:grades).where(:grades => {:id => 4}).where(:name != nil)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def grade4
    @search = Select.search(params[:q])
    @selects4 = @search.result.includes(:grades).where(:grades => {:id => 5}).where(:name != nil)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def grade5
    @search = Select.search(params[:q])
    @selects5 = @search.result.includes(:grades).where(:grades => {:id => 6}).where(:name != nil)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def grade6
    @search = Select.search(params[:q])
    @selects6 = @search.result.includes(:grades).where(:grades => {:id => 7}).where(:name != nil)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def grade7
    @search = Select.search(params[:q])
    @selects7 = @search.result.includes(:grades).where(:grades => {:id => 8}).where(:name != nil)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def grade8
    @search = Select.search(params[:q])
    @selects8 = @search.result.includes(:grades).where(:grades => {:id => 9}).where(:name != nil)
    respond_to do |format|
      format.html
      format.js
    end
  end




end
