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

describe SelectStrategiesController do

  # This should return the minimal set of attributes required to create a valid
  # SelectStrategy. As you add validations to SelectStrategy, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SelectStrategiesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all select_strategies as @select_strategies" do
      select_strategy = SelectStrategy.create! valid_attributes
      get :index, {}, valid_session
      assigns(:select_strategies).should eq([select_strategy])
    end
  end

  describe "GET show" do
    it "assigns the requested select_strategy as @select_strategy" do
      select_strategy = SelectStrategy.create! valid_attributes
      get :show, {:id => select_strategy.to_param}, valid_session
      assigns(:select_strategy).should eq(select_strategy)
    end
  end

  describe "GET new" do
    it "assigns a new select_strategy as @select_strategy" do
      get :new, {}, valid_session
      assigns(:select_strategy).should be_a_new(SelectStrategy)
    end
  end

  describe "GET edit" do
    it "assigns the requested select_strategy as @select_strategy" do
      select_strategy = SelectStrategy.create! valid_attributes
      get :edit, {:id => select_strategy.to_param}, valid_session
      assigns(:select_strategy).should eq(select_strategy)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new SelectStrategy" do
        expect {
          post :create, {:select_strategy => valid_attributes}, valid_session
        }.to change(SelectStrategy, :count).by(1)
      end

      it "assigns a newly created select_strategy as @select_strategy" do
        post :create, {:select_strategy => valid_attributes}, valid_session
        assigns(:select_strategy).should be_a(SelectStrategy)
        assigns(:select_strategy).should be_persisted
      end

      it "redirects to the created select_strategy" do
        post :create, {:select_strategy => valid_attributes}, valid_session
        response.should redirect_to(SelectStrategy.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved select_strategy as @select_strategy" do
        # Trigger the behavior that occurs when invalid params are submitted
        SelectStrategy.any_instance.stub(:save).and_return(false)
        post :create, {:select_strategy => {}}, valid_session
        assigns(:select_strategy).should be_a_new(SelectStrategy)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        SelectStrategy.any_instance.stub(:save).and_return(false)
        post :create, {:select_strategy => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested select_strategy" do
        select_strategy = SelectStrategy.create! valid_attributes
        # Assuming there are no other select_strategies in the database, this
        # specifies that the SelectStrategy created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        SelectStrategy.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => select_strategy.to_param, :select_strategy => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested select_strategy as @select_strategy" do
        select_strategy = SelectStrategy.create! valid_attributes
        put :update, {:id => select_strategy.to_param, :select_strategy => valid_attributes}, valid_session
        assigns(:select_strategy).should eq(select_strategy)
      end

      it "redirects to the select_strategy" do
        select_strategy = SelectStrategy.create! valid_attributes
        put :update, {:id => select_strategy.to_param, :select_strategy => valid_attributes}, valid_session
        response.should redirect_to(select_strategy)
      end
    end

    describe "with invalid params" do
      it "assigns the select_strategy as @select_strategy" do
        select_strategy = SelectStrategy.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SelectStrategy.any_instance.stub(:save).and_return(false)
        put :update, {:id => select_strategy.to_param, :select_strategy => {}}, valid_session
        assigns(:select_strategy).should eq(select_strategy)
      end

      it "re-renders the 'edit' template" do
        select_strategy = SelectStrategy.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SelectStrategy.any_instance.stub(:save).and_return(false)
        put :update, {:id => select_strategy.to_param, :select_strategy => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested select_strategy" do
      select_strategy = SelectStrategy.create! valid_attributes
      expect {
        delete :destroy, {:id => select_strategy.to_param}, valid_session
      }.to change(SelectStrategy, :count).by(-1)
    end

    it "redirects to the select_strategies list" do
      select_strategy = SelectStrategy.create! valid_attributes
      delete :destroy, {:id => select_strategy.to_param}, valid_session
      response.should redirect_to(select_strategies_url)
    end
  end

end
