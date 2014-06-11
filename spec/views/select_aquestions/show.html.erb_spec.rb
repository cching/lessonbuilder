require 'spec_helper'

describe "select_aquestions/show" do
  before(:each) do
    @select_aquestion = assign(:select_aquestion, stub_model(SelectAquestion,
      :aquestion_id => 1,
      :select_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
