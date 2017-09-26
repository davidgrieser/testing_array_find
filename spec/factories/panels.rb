# == Schema Information
#
# Table name: panels
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :panel do
    sequence(:name) { |n| "Panel #{n}" }
  end
end
