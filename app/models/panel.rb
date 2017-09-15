class Panel < ApplicationRecord
  has_many :antibodies

  def to_s
    self.name
  end

  def self.find_matching_antibodies(antibodies)
    return [] if antibodies.blank?
    # Panel.joins(:antibodies).where(antibodies: {name: antibodies.map(&:name)})

    panels = []
    # panel_set_a = Panel.joins(:antibodies).where(antibodies: { name: set_2[1].name })
    antibodies.each do |antibody|
      panels << Panel.joins(:antibodies).where(antibodies: { name: antibody.name })
    end

    panels << Panel.joins(:antibodies).group('panels.id').having("count(panel_id) = #{antibodies.count}")
    full_sql = panels.map(&:to_sql).join(" intersect ")

    # Panel.find_by_sql("#{panel_set_a.to_sql} intersect #{panel_set_b.to_sql} intersect #{result_matching_count.to_sql}")
    Panel.find_by_sql(full_sql)
  end
end
