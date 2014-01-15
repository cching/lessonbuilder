require 'spec_helper'

describe "select_questions/index" do
  before(:each) do
    assign(:select_questions, [
      stub_model(SelectQuestion,
        :select_id => 1,
        :question_id => 2,
        :content => "Content"
      ),
      stub_model(SelectQuestion,
        :select_id => 1,
        :question_id => 2,
        :content => "Content"
      )
    ])
  end

  it "renders a list of select_questions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Content".to_s, :count => 2
  end
end
