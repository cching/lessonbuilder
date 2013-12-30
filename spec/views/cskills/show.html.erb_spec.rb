require 'spec_helper'

describe "cskills/show" do
  before(:each) do
    @cskill = assign(:cskill, stub_model(Cskill,
      :select_id => 1,
      :standard_id => 2,
      :content => "Content"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Content/)
  end
end
