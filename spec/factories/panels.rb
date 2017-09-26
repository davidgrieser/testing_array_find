FactoryGirl.define do
  factory :panel do
    sequence(:name) { |n| "Panel #{n}" }
  end
end
