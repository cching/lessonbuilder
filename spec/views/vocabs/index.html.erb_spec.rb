require 'spec_helper'

describe "vocabs/index" do
  before(:each) do
    assign(:vocabs, [
      stub_model(Vocab),
      stub_model(Vocab)
    ])
  end

  it "renders a list of vocabs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
