class Payment < ApplicationRecord
  belongs_to :order
  self.inheritance_column = :_type_disabled

  validates :type, :value, presence: true
end
