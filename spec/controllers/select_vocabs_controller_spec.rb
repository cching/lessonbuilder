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

describe SelectVocabsController do

  # This should return the minimal set of attributes required to create a valid
  # SelectVocab. As you add validations to SelectVocab, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SelectVocabsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all select_vocabs as @select_vocabs" do
      select_vocab = SelectVocab.create! valid_attributes
      get :index, {}, valid_session
      assigns(:select_vocabs).should eq([select_vocab])
    end
  end

  describe "GET show" do
    it "assigns the requested select_vocab as @select_vocab" do
      select_vocab = SelectVocab.create! valid_attributes
      get :show, {:id => select_vocab.to_param}, valid_session
      assigns(:select_vocab).should eq(select_vocab)
    end
  end

  describe "GET new" do
    it "assigns a new select_vocab as @select_vocab" do
      get :new, {}, valid_session
      assigns(:select_vocab).should be_a_new(SelectVocab)
    end
  end

  describe "GET edit" do
    it "assigns the requested select_vocab as @select_vocab" do
      select_vocab = SelectVocab.create! valid_attributes
      get :edit, {:id => select_vocab.to_param}, valid_session
      assigns(:select_vocab).should eq(select_vocab)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new SelectVocab" do
        expect {
          post :create, {:select_vocab => valid_attributes}, valid_session
        }.to change(SelectVocab, :count).by(1)
      end

      it "assigns a newly created select_vocab as @select_vocab" do
        post :create, {:select_vocab => valid_attributes}, valid_session
        assigns(:select_vocab).should be_a(SelectVocab)
        assigns(:select_vocab).should be_persisted
      end

      it "redirects to the created select_vocab" do
        post :create, {:select_vocab => valid_attributes}, valid_session
        response.should redirect_to(SelectVocab.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved select_vocab as @select_vocab" do
        # Trigger the behavior that occurs when invalid params are submitted
        SelectVocab.any_instance.stub(:save).and_return(false)
        post :create, {:select_vocab => {}}, valid_session
        assigns(:select_vocab).should be_a_new(SelectVocab)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        SelectVocab.any_instance.stub(:save).and_return(false)
        post :create, {:select_vocab => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested select_vocab" do
        select_vocab = SelectVocab.create! valid_attributes
        # Assuming there are no other select_vocabs in the database, this
        # specifies that the SelectVocab created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        SelectVocab.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => select_vocab.to_param, :select_vocab => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested select_vocab as @select_vocab" do
        select_vocab = SelectVocab.create! valid_attributes
        put :update, {:id => select_vocab.to_param, :select_vocab => valid_attributes}, valid_session
        assigns(:select_vocab).should eq(select_vocab)
      end

      it "redirects to the select_vocab" do
        select_vocab = SelectVocab.create! valid_attributes
        put :update, {:id => select_vocab.to_param, :select_vocab => valid_attributes}, valid_session
        response.should redirect_to(select_vocab)
      end
    end

    describe "with invalid params" do
      it "assigns the select_vocab as @select_vocab" do
        select_vocab = SelectVocab.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SelectVocab.any_instance.stub(:save).and_return(false)
        put :update, {:id => select_vocab.to_param, :select_vocab => {}}, valid_session
        assigns(:select_vocab).should eq(select_vocab)
      end

      it "re-renders the 'edit' template" do
        select_vocab = SelectVocab.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SelectVocab.any_instance.stub(:save).and_return(false)
        put :update, {:id => select_vocab.to_param, :select_vocab => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested select_vocab" do
      select_vocab = SelectVocab.create! valid_attributes
      expect {
        delete :destroy, {:id => select_vocab.to_param}, valid_session
      }.to change(SelectVocab, :count).by(-1)
    end

    it "redirects to the select_vocabs list" do
      select_vocab = SelectVocab.create! valid_attributes
      delete :destroy, {:id => select_vocab.to_param}, valid_session
      response.should redirect_to(select_vocabs_url)
    end
  end

end
