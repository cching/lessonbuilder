require "spec_helper"

describe LessonResourcesController do
  describe "routing" do

    it "routes to #index" do
      get("/lesson_resources").should route_to("lesson_resources#index")
    end

    it "routes to #new" do
      get("/lesson_resources/new").should route_to("lesson_resources#new")
    end

    it "routes to #show" do
      get("/lesson_resources/1").should route_to("lesson_resources#show", :id => "1")
    end

    it "routes to #edit" do
      get("/lesson_resources/1/edit").should route_to("lesson_resources#edit", :id => "1")
    end

    it "routes to #create" do
      post("/lesson_resources").should route_to("lesson_resources#create")
    end

    it "routes to #update" do
      put("/lesson_resources/1").should route_to("lesson_resources#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/lesson_resources/1").should route_to("lesson_resources#destroy", :id => "1")
    end

  end
end
