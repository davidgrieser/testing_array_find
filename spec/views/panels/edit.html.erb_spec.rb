require 'rails_helper'

RSpec.describe "panels/edit", type: :view do
  before(:each) do
    @panel = assign(:panel, Panel.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit panel form" do
    render

    assert_select "form[action=?][method=?]", panel_path(@panel), "post" do

      assert_select "input[name=?]", "panel[name]"
    end
  end
end
