require 'spec_helper'

describe "select_aquestions/edit" do
  before(:each) do
    @select_aquestion = assign(:select_aquestion, stub_model(SelectAquestion,
      :aquestion_id => 1,
      :select_id => 1
    ))
  end

  it "renders the edit select_aquestion form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => select_aquestions_path(@select_aquestion), :method => "post" do
      assert_select "input#select_aquestion_aquestion_id", :name => "select_aquestion[aquestion_id]"
      assert_select "input#select_aquestion_select_id", :name => "select_aquestion[select_id]"
    end
  end
end
