require 'rails_helper'

RSpec.describe "panels/new", type: :view do
  before(:each) do
    assign(:panel, Panel.new(
      :name => "MyString"
    ))
  end

  it "renders new panel form" do
    render

    assert_select "form[action=?][method=?]", panels_path, "post" do

      assert_select "input[name=?]", "panel[name]"
    end
  end
end
