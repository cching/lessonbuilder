require 'spec_helper'

describe "cstrategies/show" do
  before(:each) do
    @cstrategy = assign(:cstrategy, stub_model(Cstrategy,
      :select_id => 1,
      :standard_id => "Standard",
      :content => "Content"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Standard/)
    rendered.should match(/Content/)
  end
end
