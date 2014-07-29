class LessonStepsController < ApplicationController
  include Wicked::Wizard
  steps :setup, :text, :standards, :standard_resources, :note_resources

  def show
    @select = Select.find(params[:select_id])
    @grades = @select.grades.all
    @reading_subject = @select.subject
    @subjects = @select.subsubjects.order("id ASC").all
    @standards = @select.standards.all
    @ids = @standards.map{|standard| standard.id}
    @squestions = SelectQuestion.where(:select_id => @select.id)

    render_wizard
  end

  def update
    @select = Select.find(params[:select_id])
    @resource = LessonResource.where(:select_id => @select.id).first
    if params[:select]
    params[:select][:status] = step.to_s
    end
    
    params[:select][:status] = 'active' if step == steps.last
    
    if (@select.book.try(:title) != nil) && (@resource.try(:book) == nil)
      @resource.book = @select.book.example
      @resource.save
    end
  if @select.update_attributes(params[:select])
  @select.selections.each do |selection|
    if selection.initiate?
    else
             Question.where(:standard_id => selection.standard_id).each do |question|
                xquestion = Xquestion.new
                xquestion.content = question.content
                xquestion.standard_id = question.standard_id
                xquestion.select_id = @select.id
                xquestion.save
              end


              Skill.where(:standard_id => selection.standard_id).each do |skill|
                 xskill = Xskill.new
                xskill.content = skill.content
                xskill.standard_id = skill.standard_id
                xskill.select_id = @select.id
                xskill.save
              end

              Vocab.where(:standard_id => selection.standard_id).each do |vocab|
                xvocab = Xvocab.new
                xvocab.content_english = vocab.content_english
                xvocab.standard_id = vocab.standard_id
                xvocab.select_id = @select.id
                xvocab.save
              end

              Strategy.where(:standard_id => selection.standard_id).each do |strategy|
                xstrategy = Xstrategy.new
                xstrategy.content = strategy.content
                xstrategy.standard_id = strategy.standard_id
                xstrategy.select_id = @select.id
                xstrategy.save
              end

              Link.where(:standard_id => selection.standard_id).each do |link|
                xlink = Xlink.new
                xlink.comment = link.comment
                xlink.link = link.link
                xlink.standard_id = link.standard_id
                xlink.select_id = @select.id
                xlink.save
              end
              selection.initiate = true
              selection.save
      end
  end
    end
    render_wizard @select

    end

  def finish_wizard_path
    @select = Select.find(params[:select_id])
    edit_select_path(@select)
  end

  def hide
    respond_to :js
  end

end
