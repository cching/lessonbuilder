require 'spec_helper'

describe "select_questions/edit" do
  before(:each) do
    @select_question = assign(:select_question, stub_model(SelectQuestion,
      :select_id => 1,
      :question_id => 1,
      :content => "MyString"
    ))
  end

  it "renders the edit select_question form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => select_questions_path(@select_question), :method => "post" do
      assert_select "input#select_question_select_id", :name => "select_question[select_id]"
      assert_select "input#select_question_question_id", :name => "select_question[question_id]"
      assert_select "input#select_question_content", :name => "select_question[content]"
    end
  end
end
