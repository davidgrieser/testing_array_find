require 'rails_helper'

RSpec.describe "antibodies/new", type: :view do
  before(:each) do
    assign(:antibody, Antibody.new(
      :name => "MyString",
      :amount => "9.99",
      :panel => nil
    ))
  end

  it "renders new antibody form" do
    render

    assert_select "form[action=?][method=?]", antibodies_path, "post" do

      assert_select "input[name=?]", "antibody[name]"

      assert_select "input[name=?]", "antibody[amount]"

      assert_select "input[name=?]", "antibody[panel_id]"
    end
  end
end
