require 'spec_helper'

describe "caquestions/show" do
  before(:each) do
    @caquestion = assign(:caquestion, stub_model(Caquestion,
      :standard_id => 1,
      :select_id => 2,
      :content => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/MyText/)
  end
end
