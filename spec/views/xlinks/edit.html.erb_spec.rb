require 'spec_helper'

describe "xlinks/edit" do
  before(:each) do
    @xlink = assign(:xlink, stub_model(Xlink))
  end

  it "renders the edit xlink form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => xlinks_path(@xlink), :method => "post" do
    end
  end
end
