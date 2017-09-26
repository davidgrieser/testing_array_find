# == Schema Information
#
# Table name: antibodies
#
#  id         :integer          not null, primary key
#  name       :string
#  amount     :decimal(, )
#  panel_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_antibodies_on_panel_id  (panel_id)
#

FactoryGirl.define do
  factory :antibody do
    sequence(:name) { |n| "Antibody #{n}" }
    amount { (rand() * 100).round(2) }
    association :panel
  end
end
