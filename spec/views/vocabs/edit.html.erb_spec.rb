require 'spec_helper'

describe "vocabs/edit" do
  before(:each) do
    @vocab = assign(:vocab, stub_model(Vocab))
  end

  it "renders the edit vocab form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => vocabs_path(@vocab), :method => "post" do
    end
  end
end
