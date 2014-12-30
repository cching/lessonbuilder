class LessonStepsController < ApplicationController
  include Wicked::Wizard
  steps :setup, :text, :standards, :instructional_plan, :instructional_norms

  def show

    @select = Select.find(params[:select_id])
    @grades = @select.grades.all
    @reading_subject = @select.subjects
    @subjects = @select.subsubjects.order("id ASC").all
    @standards = @select.standards.all
    @ids = @standards.map{|standard| standard.id}
    @sources = @select.sources.map{|source| source.name}
    @squestions = SelectQuestion.where(:select_id => @select.id)
    @svocabs = SelectVocab.where(:select_id => @select.id)
    @sstrategies = SelectStrategy.where(:select_id => @select.id)
    @sskills = SelectSkill.where(:select_id => @select.id)
    @slinks = SelectLink.where(:select_id => @select.id)
    @saquestions = SelectAquestion.where(:select_id => @select.id)

    if @select.try(:status) == 'standards' && @select.drive == false
      require './lib/update_drive'
    file = Update::Drive.new(@select)
    file.update

    @select.drive = true
    @select.save
    end

    if @select.resource_id != nil
    @url = 'https://docs.google.com/document/d/' + @select.resource_id + '/edit?usp=sharing'
  else
    @url = 'https://docs.google.com/document/d/'
  end
    render_wizard
  end


  
  def update
    @select = Select.find(params[:select_id])
    @resource = LessonResource.where(:select_id => @select.id).first

    
    
  

    if params[:select]
    params[:select][:status] = step.to_s  
    params[:select][:status] = 'active' if step == steps.last
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

              Aquestion.where(:standard_id => selection.standard_id).each do |aquestion|
                xaquestion = Xaquestion.new
                xaquestion.content = aquestion.content
                xaquestion.standard_id = aquestion.standard_id
                xaquestion.select_id = @select.id
                xaquestion.save
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
