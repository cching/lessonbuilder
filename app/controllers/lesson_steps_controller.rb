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
    params[:select][:status] = 'active' if step == steps.last
    @select.update_attributes(params[:select])
    render_wizard @select
  end

  def finish_wizard_path
    @select = Select.find(params[:select_id])
    edit_select_path(@select)
  end


end
