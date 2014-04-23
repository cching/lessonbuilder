require 'spec_helper'

describe "aquestions/edit" do
  before(:each) do
    @aquestion = assign(:aquestion, stub_model(Aquestion,
      :content => "MyText",
      :standard_id => 1
    ))
  end

  it "renders the edit aquestion form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => aquestions_path(@aquestion), :method => "post" do
      assert_select "textarea#aquestion_content", :name => "aquestion[content]"
      assert_select "input#aquestion_standard_id", :name => "aquestion[standard_id]"
    end
  end
end
