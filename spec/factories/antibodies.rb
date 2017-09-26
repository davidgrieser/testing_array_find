FactoryGirl.define do
  factory :antibody do
    sequence(:name) { |n| "Antibody #{n}" }
    amount { (rand() * 100).round(2) }
    association :panel
  end
end
