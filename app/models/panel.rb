class Panel < ApplicationRecord
  def to_s
    self.name
  end
end
