class Order < ApplicationRecord

    has_many :payments
    has_many :items
    has_one :customer
    
    accepts_nested_attributes_for :payments
    validates_associated :payments
    
    accepts_nested_attributes_for :items
    validates_associated :items
   
    accepts_nested_attributes_for :customer
    validates_associated :customer

    validates :external_code,
        :store_id,
        :sub_total,
        :delivery_fee,
        :total,
        :country,
        :state,
        :city,
        :district,
        :street,
        :complement,
        :longitude,
        :latitude,
        :dt_order_create,
        :number,
        :postal_code, presence: true
end
