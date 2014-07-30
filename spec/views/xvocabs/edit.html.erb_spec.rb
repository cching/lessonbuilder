require 'spec_helper'

describe "xvocabs/edit" do
  before(:each) do
    @xvocab = assign(:xvocab, stub_model(Xvocab))
  end

  it "renders the edit xvocab form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => xvocabs_path(@xvocab), :method => "post" do
    end
  end
end
