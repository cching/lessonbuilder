require 'spec_helper'

describe "select_skills/show" do
  before(:each) do
    @select_skill = assign(:select_skill, stub_model(SelectSkill,
      :select_id => 1,
      :skill_id => 2,
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
