class GoogleFormsController < ApplicationController
  before_filter :set_google_form, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @google_forms = GoogleForm.all
    respond_with(@google_forms)
  end

  def show
    respond_with(@google_form)
  end

  def new
    @google_form = GoogleForm.new
    respond_with(@google_form)
  end

  def edit
  end

  def create
    @google_form = GoogleForm.new(params[:google_form])
    @google_form.save
    respond_with(@google_form)
  end

  def update
    @google_form.update_attributes(params[:google_form])
    respond_with(@google_form)
  end

  def destroy
    @google_form.destroy
    respond_with(@google_form)
  end

  private
    def set_google_form
      @google_form = GoogleForm.find(params[:id])
    end
end
