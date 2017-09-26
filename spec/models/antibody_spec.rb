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

require 'rails_helper'

RSpec.describe Antibody, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
