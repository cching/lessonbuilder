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


    @select.update_attributes(params[:select])
    render_wizard @select
  end

  def finish_wizard_path
    @select = Select.find(params[:select_id])
    edit_select_path(@select)
  end


end
