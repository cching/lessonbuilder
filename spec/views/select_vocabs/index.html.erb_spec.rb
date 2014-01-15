require 'spec_helper'

describe "select_vocabs/index" do
  before(:each) do
    assign(:select_vocabs, [
      stub_model(SelectVocab,
        :select_id => 1,
        :vocab_id => 2,
        :content_english => "Content English"
      ),
      stub_model(SelectVocab,
        :select_id => 1,
        :vocab_id => 2,
        :content_english => "Content English"
      )
    ])
  end

  it "renders a list of select_vocabs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Content English".to_s, :count => 2
  end
end
