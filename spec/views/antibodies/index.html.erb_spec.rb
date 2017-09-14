require 'rails_helper'

RSpec.describe "antibodies/index", type: :view do
  before(:each) do
    assign(:antibodies, [
      Antibody.create!(
        :name => "Name",
        :amount => "9.99",
        :panel => nil
      ),
      Antibody.create!(
        :name => "Name",
        :amount => "9.99",
        :panel => nil
      )
    ])
  end

  it "renders a list of antibodies" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
