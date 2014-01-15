require 'spec_helper'

describe "SelectSkills" do
  describe "GET /select_skills" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get select_skills_path
      response.status.should be(200)
    end
  end
end
