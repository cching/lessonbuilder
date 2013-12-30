require 'spec_helper'

describe "vocabs/show" do
  before(:each) do
    @vocab = assign(:vocab, stub_model(Vocab))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
