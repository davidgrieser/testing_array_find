require 'rails_helper'

RSpec.describe "antibodies/edit", type: :view do
  before(:each) do
    @antibody = assign(:antibody, Antibody.create!(
      :name => "MyString",
      :amount => "9.99",
      :panel => nil
    ))
  end

  it "renders the edit antibody form" do
    render

    assert_select "form[action=?][method=?]", antibody_path(@antibody), "post" do

      assert_select "input[name=?]", "antibody[name]"

      assert_select "input[name=?]", "antibody[amount]"

      assert_select "input[name=?]", "antibody[panel_id]"
    end
  end
end
