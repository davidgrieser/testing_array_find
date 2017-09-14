require 'rails_helper'

RSpec.describe "panels/show", type: :view do
  before(:each) do
    @panel = assign(:panel, Panel.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
