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
           @select.notes ||= 
    "1. Learning Objective.
Check for Understanding; what are we going to do today? What are we going to (skill)

2. Activate Prior Knowledge.
Check for Understanding
Connection to new learning

3. Concept Development
Provide written definitions and examples.
Cognitive Strategies
Check for Understanding

4. Skill Development/Guided Practice
Strategic Steps
Provide matched teacher/student problems
Check for understanding

5. Relevance
Provide reasons with examples
Check for Understanding

6. Closure
Concept
Skill

7. Summary Closure; what did you learn today about _____

8. Independent Practice"

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
            #duplicating skills for user
            @select.skills.each do |skill|
              if skill.duplicate 
                skill.duplicate = TRUE
                skill.save

            else
              skill.user_id = current_user.id
              skill.duplicate = TRUE
              skill.save
              new_skill = skill.dup
              new_skill.standard_id = skill.standard.id
              new_skill.content = skill.content
              new_skill.user_id = 0
              new_skill.duplicate = FALSE
              new_skill.save
            end
            end
          #duplicating vocabulary for user
            @select.vocabs.each do |vocab|
              if vocab.duplicate 
                vocab.duplicate = TRUE
                vocab.save

            else
              vocab.user_id = current_user.id
              vocab.duplicate = TRUE
              vocab.save
              new_vocab = vocab.dup
              new_vocab.standard_id = vocab.standard.id
              new_vocab.content_english = vocab.content_english
              new_vocab.content_spanish = vocab.content_spanish
              new_vocab.user_id = 0
              new_vocab.duplicate = FALSE
              new_vocab.save
            end
            end
            #duplicating strategies for user
            @select.strategies.each do |strategy|
              if strategy.duplicate 
                strategy.duplicate = TRUE
                strategy.save

            else
              strategy.user_id = current_user.id
              strategy.duplicate = TRUE
              strategy.save
              new_strategy = strategy.dup
              new_strategy.standard_id = strategy.standard.id
              new_strategy.content = strategy.content
              new_strategy.user_id = 0
              new_strategy.duplicate = FALSE
              new_strategy.save
            end
            end
            #duplicating resources for user
            @select.links.each do |link|
              if link.duplicate 
                link.duplicate = TRUE
                link.save

            else
              link.user_id = current_user.id
              link.duplicate = TRUE
              link.save
              new_link = link.dup
              new_link.standard_id = link.standard.id
              new_link.comment = link.comment
              new_link.link = link.link
              new_link.user_id = 0
              new_link.duplicate = FALSE
              new_link.save
            end
            end
            #duplicating questions for user
            @select.questions.each do |question|
              if question.duplicate 
                question.duplicate = TRUE
                question.save

            else
              question.user_id = current_user.id
              question.duplicate = TRUE
              question.save
              new_question = question.dup
              new_question.standard_id = question.standard.id
              new_question.content = question.content
              new_question.user_id = 0
              new_question.duplicate = FALSE
              new_question.save
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
