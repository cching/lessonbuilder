require "spec_helper"

describe LessonplansController do
  describe "routing" do

    it "routes to #index" do
      get("/lessonplans").should route_to("lessonplans#index")
    end

    it "routes to #new" do
      get("/lessonplans/new").should route_to("lessonplans#new")
    end

    it "routes to #show" do
      get("/lessonplans/1").should route_to("lessonplans#show", :id => "1")
    end

    it "routes to #edit" do
      get("/lessonplans/1/edit").should route_to("lessonplans#edit", :id => "1")
    end

    it "routes to #create" do
      post("/lessonplans").should route_to("lessonplans#create")
    end

    it "routes to #update" do
      put("/lessonplans/1").should route_to("lessonplans#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/lessonplans/1").should route_to("lessonplans#destroy", :id => "1")
    end

  end
end
