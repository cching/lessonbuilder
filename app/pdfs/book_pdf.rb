class BookPdf < Prawn::Document
  def initialize(book)
    super(top_margin: 70)
    @book = book
    font_size 20
    text "#{@book.title}", :align => :center, :style => :bold, :style => :italic

    font_size 14
    move_down 5
    text "#{@book.author}", :align => :center
  

  move_down 30
  font_size 12
  text "Publisher:", :style => :bold
  text "#{@book.publisher}"

  move_down 10
  text "Example Text:", :style => :bold
  text "#{@book.example}"
end
    
end