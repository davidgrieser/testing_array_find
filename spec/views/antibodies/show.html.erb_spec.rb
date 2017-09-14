require 'rails_helper'

RSpec.describe "antibodies/show", type: :view do
  before(:each) do
    @antibody = assign(:antibody, Antibody.create!(
      :name => "Name",
      :amount => "9.99",
      :panel => Panel.create!(name: 'Sample Panel')
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Sample Panel/)
  end
end
