require 'rails_helper'

RSpec.describe "panels/index", type: :view do
  before(:each) do
    assign(:panels, [
      Panel.create!(
        :name => "Name"
      ),
      Panel.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of panels" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
