require 'spec_helper'

describe "xvocabs/show" do
  before(:each) do
    @xvocab = assign(:xvocab, stub_model(Xvocab))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
