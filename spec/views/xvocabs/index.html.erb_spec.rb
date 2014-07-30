require 'spec_helper'

describe "xvocabs/index" do
  before(:each) do
    assign(:xvocabs, [
      stub_model(Xvocab),
      stub_model(Xvocab)
    ])
  end

  it "renders a list of xvocabs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
