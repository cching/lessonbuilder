class BooksController < ApplicationController
  # GET /books
  # GET /books.json
  def index
    @book = Book.all
    @grade = Grade.all


    respond_to do |format|
      format.js
      format.html # index.html.erb
      format.json { render json: @books }
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @book = Book.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.js # show.js.erb
      format.json { render json: @book }
                  format.pdf do
        pdf = BookPdf.new(@book)
        send_data pdf.render, filename: "#{@book.title}",
                              type: "application/pdf"

      end
    end
  end

  def show2
    @book = Book.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.js # show.js.erb
      format.json { render json: @book }
            format.pdf do
        pdf = BookPdf.new(@book)
        send_data pdf.render, filename: "#{@book.title}",
                              type: "application/pdf"

      end
    end
  end

  def show_sources
    respond_to do |format|
      format.js
    end
  end

  # GET /books/new
  # GET /books/new.json
  def new
    @book = Book.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @book }
    end
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.create( params[:book] )

    respond_to do |format|
      if @book.save
        format.html { redirect_to books_path, notice: 'Book was successfully created.' }
        format.json { render json: @book, status: :created, location: @book }
      else
        format.html { render action: "new" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /books/1
  # PUT /books/1.json
  def update
    @book = Book.find(params[:id])

    respond_to do |format|
      if @book.update_attributes(params[:book])
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :no_content }
    end
  end

  def hide
    @grade = Grade.find(params[:grade])

    @category = Textcategory.find(params[:category])
    @source = Source.find(params[:source])
    respond_to do |format|
      format.js
    end
  end

  def grade
    @grade = Grade.find(params[:grade])
    @sources = Source.where(:id => 1..7)
    @category = Textcategory.all
    respond_to do |format|
      format.js
    end
  end

  def show_list
    respond_to :js
  end

  def select_books
    @book = Book.find(params[:book_id])
    @select = Select.find(params[:select_id])
      @selects = SelectText.new
      @selects.select_id = @select.id
      @selects.book_id = @book.id

      if @selects.save
      respond_to do |format|
        format.js
      end
      end
end

    def unselect_books
    @book = Book.find(params[:book_id])
    @select = Select.find(params[:select_id])
      @selects = SelectText.where(:book_id => @book.id).where(:select_id => @select.id).last
      @selects.delete
      respond_to :js
    end
end
