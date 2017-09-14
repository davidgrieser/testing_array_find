require 'rails_helper'

RSpec.describe "antibodies/index", type: :view do
  before(:each) do
    assign(:antibodies, [
      Antibody.create!(
        :name => "Antibody",
        :amount => "9.99",
        :panel => Panel.create!(name: 'Sample Panel')
      ),
      Antibody.create!(
        :name => "Antibody",
        :amount => "9.99",
        :panel => Panel.create!(name: 'Sample Panel')
      )
    ])
  end

  it "renders a list of antibodies" do
    render
    assert_select "tr>td", :text => "Antibody".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Sample Panel".to_s, :count => 2
  end
end
