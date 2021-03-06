require 'spec_helper'

describe "books/edit" do
  before(:each) do
    @book = assign(:book, stub_model(Book,
      :author => "MyString",
      :publisher => "MyText",
      :title => "MyString",
      :assess_questions => "MyText",
      :availability => "MyText"
    ))
  end

  it "renders the edit book form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => books_path(@book), :method => "post" do
      assert_select "input#book_author", :name => "book[author]"
      assert_select "textarea#book_publisher", :name => "book[publisher]"
      assert_select "input#book_title", :name => "book[title]"
      assert_select "textarea#book_assess_questions", :name => "book[assess_questions]"
      assert_select "textarea#book_availability", :name => "book[availability]"
    end
  end
end
