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

describe SelectQuestionsController do

  # This should return the minimal set of attributes required to create a valid
  # SelectQuestion. As you add validations to SelectQuestion, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SelectQuestionsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all select_questions as @select_questions" do
      select_question = SelectQuestion.create! valid_attributes
      get :index, {}, valid_session
      assigns(:select_questions).should eq([select_question])
    end
  end

  describe "GET show" do
    it "assigns the requested select_question as @select_question" do
      select_question = SelectQuestion.create! valid_attributes
      get :show, {:id => select_question.to_param}, valid_session
      assigns(:select_question).should eq(select_question)
    end
  end

  describe "GET new" do
    it "assigns a new select_question as @select_question" do
      get :new, {}, valid_session
      assigns(:select_question).should be_a_new(SelectQuestion)
    end
  end

  describe "GET edit" do
    it "assigns the requested select_question as @select_question" do
      select_question = SelectQuestion.create! valid_attributes
      get :edit, {:id => select_question.to_param}, valid_session
      assigns(:select_question).should eq(select_question)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new SelectQuestion" do
        expect {
          post :create, {:select_question => valid_attributes}, valid_session
        }.to change(SelectQuestion, :count).by(1)
      end

      it "assigns a newly created select_question as @select_question" do
        post :create, {:select_question => valid_attributes}, valid_session
        assigns(:select_question).should be_a(SelectQuestion)
        assigns(:select_question).should be_persisted
      end

      it "redirects to the created select_question" do
        post :create, {:select_question => valid_attributes}, valid_session
        response.should redirect_to(SelectQuestion.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved select_question as @select_question" do
        # Trigger the behavior that occurs when invalid params are submitted
        SelectQuestion.any_instance.stub(:save).and_return(false)
        post :create, {:select_question => {}}, valid_session
        assigns(:select_question).should be_a_new(SelectQuestion)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        SelectQuestion.any_instance.stub(:save).and_return(false)
        post :create, {:select_question => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested select_question" do
        select_question = SelectQuestion.create! valid_attributes
        # Assuming there are no other select_questions in the database, this
        # specifies that the SelectQuestion created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        SelectQuestion.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => select_question.to_param, :select_question => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested select_question as @select_question" do
        select_question = SelectQuestion.create! valid_attributes
        put :update, {:id => select_question.to_param, :select_question => valid_attributes}, valid_session
        assigns(:select_question).should eq(select_question)
      end

      it "redirects to the select_question" do
        select_question = SelectQuestion.create! valid_attributes
        put :update, {:id => select_question.to_param, :select_question => valid_attributes}, valid_session
        response.should redirect_to(select_question)
      end
    end

    describe "with invalid params" do
      it "assigns the select_question as @select_question" do
        select_question = SelectQuestion.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SelectQuestion.any_instance.stub(:save).and_return(false)
        put :update, {:id => select_question.to_param, :select_question => {}}, valid_session
        assigns(:select_question).should eq(select_question)
      end

      it "re-renders the 'edit' template" do
        select_question = SelectQuestion.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SelectQuestion.any_instance.stub(:save).and_return(false)
        put :update, {:id => select_question.to_param, :select_question => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested select_question" do
      select_question = SelectQuestion.create! valid_attributes
      expect {
        delete :destroy, {:id => select_question.to_param}, valid_session
      }.to change(SelectQuestion, :count).by(-1)
    end

    it "redirects to the select_questions list" do
      select_question = SelectQuestion.create! valid_attributes
      delete :destroy, {:id => select_question.to_param}, valid_session
      response.should redirect_to(select_questions_url)
    end
  end

end
