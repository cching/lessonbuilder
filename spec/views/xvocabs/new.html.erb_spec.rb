require 'spec_helper'

describe "xvocabs/new" do
  before(:each) do
    assign(:xvocab, stub_model(Xvocab).as_new_record)
  end

  it "renders new xvocab form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => xvocabs_path, :method => "post" do
    end
  end
end
