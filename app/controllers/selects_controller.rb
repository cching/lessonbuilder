class SelectsController < ApplicationController

  def index
    @search = Select.search(params[:q])
    @selects = @search.result.paginate(:page => params[:page], :per_page => 30)
  end


  def show
    @select = Select.find(params[:id])
    @standard = @select.standards.first
    @standards = @select.standards.all
    @questions = @select.questions.all
    respond_to do |format|
      format.html
      format.pdf do
    render :pdf => "#{@select.name}",
    :save_to_file => Rails.root.join('pdfs', "#{@select.name}.pdf")
      end
    end
  end

  def new
    @select = Select.new

  end

  def edit
    @select = Select.find(params[:id])
    @standards = @select.standards.all
  end

  def create
    @select = current_user.selects.build(params[:select])
    lessonplan = Lessonplan.where(:district_id => current_user.district_id).last
    @select.notes = lessonplan.content


  if @select.save
    
        redirect_to lesson_steps_path(:select_id => @select.id)

  else
    render :new
  end
  end
  
  def update
    @select = Select.find(params[:id])

    respond_to do |format|

      if @select.update_attributes(params[:select])

        @select.questions.each do |question|
          @select.select_questions.where(:question_id => question.id).each do |squestion|
            if squestion.initiate?
                          squestion.content = squestion.content

          else
            squestion.content = question.content
            squestion.initiate = TRUE
            squestion.save
          end

        end
      end

              @select.skills.each do |skill|
          @select.select_skills.where(:skill_id => skill.id).each do |sskill|
            if sskill.initiate?
                          sskill.content = sskill.content

          else
            sskill.initiate = TRUE
            sskill.content = skill.content
            sskill.save
          end
        end
      end

      @select.strategies.each do |strategy|
          @select.select_strategies.where(:strategy_id => strategy.id).each do |sstrategy|
            if sstrategy.initiates?
              sstrategy.content = sstrategy.content
            
          else
            sstrategy.initiate = TRUE
            sstrategy.content = strategy.content
            sstrategy.save
          end
        end
      end

@select.vocabs.each do |vocab|
          @select.select_vocabs.where(:vocab_id => vocab.id).each do |svocab|
            if svocab.initiate?
              svocab.content_english = svocab.content_english
            
          else
            svocab.initiate = TRUE
            svocab.content_english = vocab.content_english
            svocab.save
          end
        end
      end

      @select.links.each do |link|
          @select.select_links.where(:link_id => link.id).each do |slink|
            if slink.initiate?
            slink.comment = slink.comment
          else
            slink.initiate = TRUE
            slink.comment = link.comment
            slink.save
            
          end
        end
      end

        format.html { redirect_to @select, notice: 'Click on the resources to edit' }
        format.json { respond_with_bip(@select) }
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
