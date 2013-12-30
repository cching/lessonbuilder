require 'spec_helper'

describe "vocabs/new" do
  before(:each) do
    assign(:vocab, stub_model(Vocab).as_new_record)
  end

  it "renders new vocab form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => vocabs_path, :method => "post" do
    end
  end
end
