# == Schema Information
#
# Table name: panels
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Panel < ApplicationRecord
  has_many :antibodies

  def to_s
    self.name
  end

  def self.find_matching_antibodies(antibodies)
    return [] if antibodies.blank?
    # Panel.joins(:antibodies).where(antibodies: {name: antibodies.map(&:name)})

    panels = []
    # Find each Panel that has a matching Antibody
    antibodies.each do |antibody|
      panels << Panel.joins(:antibodies).where(antibodies: { name: antibody.name })
    end

    # Find all Panels that the same number of Antibodies as the input
    panels << Panel.joins(:antibodies).group('panels.id').having("count(panel_id) = #{antibodies.count}")

    # Find the intersection of all matching panels from the above queries
    full_sql = panels.map(&:to_sql).join(" intersect ")

    # Perform the actual SQL query
    results = Panel.find_by_sql(full_sql)

    # Select only those records that exactly match - handles duplicates
    results.select { |panel| (panel.antibodies.map(&:name) - antibodies.map(&:name)).empty? }
  end
end
