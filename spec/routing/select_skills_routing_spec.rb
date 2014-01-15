require "spec_helper"

describe SelectSkillsController do
  describe "routing" do

    it "routes to #index" do
      get("/select_skills").should route_to("select_skills#index")
    end

    it "routes to #new" do
      get("/select_skills/new").should route_to("select_skills#new")
    end

    it "routes to #show" do
      get("/select_skills/1").should route_to("select_skills#show", :id => "1")
    end

    it "routes to #edit" do
      get("/select_skills/1/edit").should route_to("select_skills#edit", :id => "1")
    end

    it "routes to #create" do
      post("/select_skills").should route_to("select_skills#create")
    end

    it "routes to #update" do
      put("/select_skills/1").should route_to("select_skills#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/select_skills/1").should route_to("select_skills#destroy", :id => "1")
    end

  end
end
