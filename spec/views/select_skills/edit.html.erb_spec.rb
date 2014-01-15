require 'spec_helper'

describe "select_skills/edit" do
  before(:each) do
    @select_skill = assign(:select_skill, stub_model(SelectSkill,
      :select_id => 1,
      :skill_id => 1,
      :content => "MyString"
    ))
  end

  it "renders the edit select_skill form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => select_skills_path(@select_skill), :method => "post" do
      assert_select "input#select_skill_select_id", :name => "select_skill[select_id]"
      assert_select "input#select_skill_skill_id", :name => "select_skill[skill_id]"
      assert_select "input#select_skill_content", :name => "select_skill[content]"
    end
  end
end
