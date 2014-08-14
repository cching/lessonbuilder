require 'spec_helper'

describe "assessments/index" do
  before(:each) do
    assign(:assessments, [
      stub_model(Assessment,
        :select_id => "",
        :title => "Title"
      ),
      stub_model(Assessment,
        :select_id => "",
        :title => "Title"
      )
    ])
  end

  it "renders a list of assessments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
