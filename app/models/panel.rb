class Panel < ApplicationRecord
  has_many :antibodies

  def to_s
    self.name
  end

  def self.find_matching_antibodies(antibodies)
    return [] if antibodies.blank?
    Panel.joins(:antibodies).where(antibodies: {name: antibodies[0].name})
  end
end
