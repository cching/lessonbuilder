require 'spec_helper'

describe "select_aquestions/index" do
  before(:each) do
    assign(:select_aquestions, [
      stub_model(SelectAquestion,
        :aquestion_id => 1,
        :select_id => 2
      ),
      stub_model(SelectAquestion,
        :aquestion_id => 1,
        :select_id => 2
      )
    ])
  end

  it "renders a list of select_aquestions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
