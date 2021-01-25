class Customer < ApplicationRecord

  belongs_to :order

  validates :external_code, :name, :email, :contact, presence: true

end
