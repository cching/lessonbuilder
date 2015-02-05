class FormsController < ApplicationController
  before_filter :set_form, only: [:show, :edit, :update, :destroy, :update]

  respond_to :html

 # GET /forms.json
  def index
    @forms = Form.where(:name != "" || :name != nil)
  end

  # GET /forms/1
  # GET /forms/1.json
  def show
    @form = Form.find(params[:id])
  end

  # GET /forms/new
  def new
    @form = Form.new
    @form.item_forms.build
    @form.save
    Item.all.each do |item|
      i = ItemForm.new
      i.form_id = @form.id
      i.item_id = item.id
      i.save
    end

    redirect_to form_path(@form)
  end

  # GET /forms/1/edit
  def edit
    @form = Form.find(params[:id])
    @form.item_forms.where("quantity <= ?", 0).destroy_all
    j = 0
    @form.items.each do |item|
      q = item.item_forms.where(:form_id => @form.id).last
      i = (q.quantity * item.price)
      j = j + i
    end
    @total = j.to_f
    UserMailer.send_share(@form, @total).deliver
    UserMailer.send_notice(@form, @total).deliver
    redirect_to 'http://shoobphoto.com/'
  end

  # POST /forms
  # POST /forms.json
  def create
    @form = Form.new

    respond_to do |format|
      if @form.save
        format.html { redirect_to @form, notice: 'Form was successfully created.' }
        format.json { render :show, status: :created, location: @form }
      else
        format.html { render :new }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forms/1
  # PATCH/PUT /forms/1.json
  def update
    respond_to do |format|
      if @form.update_attributes(params[:form])
        format.html { redirect_to edit_form_path(@form) }
        format.json { render :show, status: :ok, location: @form }
      else
        format.html { render :edit }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end



  # DELETE /forms/1
  # DELETE /forms/1.json
  def destroy
    @form.destroy
    respond_to do |format|
      format.html { redirect_to forms_url, notice: 'Form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form
      @form = Form.find(params[:id])
    end
end
