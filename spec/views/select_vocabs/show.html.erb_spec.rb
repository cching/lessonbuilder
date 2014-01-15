require 'spec_helper'

describe "select_vocabs/show" do
  before(:each) do
    @select_vocab = assign(:select_vocab, stub_model(SelectVocab,
      :select_id => 1,
      :vocab_id => 2,
      :content_english => "Content English"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Content English/)
  end
end
