require 'spec_helper'

describe "select_vocabs/edit" do
  before(:each) do
    @select_vocab = assign(:select_vocab, stub_model(SelectVocab,
      :select_id => 1,
      :vocab_id => 1,
      :content_english => "MyString"
    ))
  end

  it "renders the edit select_vocab form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => select_vocabs_path(@select_vocab), :method => "post" do
      assert_select "input#select_vocab_select_id", :name => "select_vocab[select_id]"
      assert_select "input#select_vocab_vocab_id", :name => "select_vocab[vocab_id]"
      assert_select "input#select_vocab_content_english", :name => "select_vocab[content_english]"
    end
  end
end
