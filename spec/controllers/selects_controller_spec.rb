require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe SelectsController do

  # This should return the minimal set of attributes required to create a valid
  # Select. As you add validations to Select, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SelectsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all selects as @selects" do
      select = Select.create! valid_attributes
      get :index, {}, valid_session
      assigns(:selects).should eq([select])
    end
  end

  describe "GET show" do
    it "assigns the requested select as @select" do
      select = Select.create! valid_attributes
      get :show, {:id => select.to_param}, valid_session
      assigns(:select).should eq(select)
    end
  end

  describe "GET new" do
    it "assigns a new select as @select" do
      get :new, {}, valid_session
      assigns(:select).should be_a_new(Select)
    end
  end

  describe "GET edit" do
    it "assigns the requested select as @select" do
      select = Select.create! valid_attributes
      get :edit, {:id => select.to_param}, valid_session
      assigns(:select).should eq(select)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Select" do
        expect {
          post :create, {:select => valid_attributes}, valid_session
        }.to change(Select, :count).by(1)
      end

      it "assigns a newly created select as @select" do
        post :create, {:select => valid_attributes}, valid_session
        assigns(:select).should be_a(Select)
        assigns(:select).should be_persisted
      end

      it "redirects to the created select" do
        post :create, {:select => valid_attributes}, valid_session
        response.should redirect_to(Select.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved select as @select" do
        # Trigger the behavior that occurs when invalid params are submitted
        Select.any_instance.stub(:save).and_return(false)
        post :create, {:select => {}}, valid_session
        assigns(:select).should be_a_new(Select)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Select.any_instance.stub(:save).and_return(false)
        post :create, {:select => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested select" do
        select = Select.create! valid_attributes
        # Assuming there are no other selects in the database, this
        # specifies that the Select created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Select.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => select.to_param, :select => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested select as @select" do
        select = Select.create! valid_attributes
        put :update, {:id => select.to_param, :select => valid_attributes}, valid_session
        assigns(:select).should eq(select)
      end

      it "redirects to the select" do
        select = Select.create! valid_attributes
        put :update, {:id => select.to_param, :select => valid_attributes}, valid_session
        response.should redirect_to(select)
      end
    end

    describe "with invalid params" do
      it "assigns the select as @select" do
        select = Select.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Select.any_instance.stub(:save).and_return(false)
        put :update, {:id => select.to_param, :select => {}}, valid_session
        assigns(:select).should eq(select)
      end

      it "re-renders the 'edit' template" do
        select = Select.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Select.any_instance.stub(:save).and_return(false)
        put :update, {:id => select.to_param, :select => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested select" do
      select = Select.create! valid_attributes
      expect {
        delete :destroy, {:id => select.to_param}, valid_session
      }.to change(Select, :count).by(-1)
    end

    it "redirects to the selects list" do
      select = Select.create! valid_attributes
      delete :destroy, {:id => select.to_param}, valid_session
      response.should redirect_to(selects_url)
    end
  end

end
