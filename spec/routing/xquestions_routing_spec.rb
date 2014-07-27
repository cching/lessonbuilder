require "spec_helper"

describe XquestionsController do
  describe "routing" do

    it "routes to #index" do
      get("/xquestions").should route_to("xquestions#index")
    end

    it "routes to #new" do
      get("/xquestions/new").should route_to("xquestions#new")
    end

    it "routes to #show" do
      get("/xquestions/1").should route_to("xquestions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/xquestions/1/edit").should route_to("xquestions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/xquestions").should route_to("xquestions#create")
    end

    it "routes to #update" do
      put("/xquestions/1").should route_to("xquestions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/xquestions/1").should route_to("xquestions#destroy", :id => "1")
    end

  end
end
