
class Api::V1::OrdersController < ApplicationController
  before_action :generate_payload
  before_action :create_order

  def create
    if ProcessOrderService.call(@builder.payload_camel_case)
      render status: :created
    else
      render status: :service_unavailable
    end
  end

  def generate_payload
    @builder = Payload::Builder.new(order_params)
  end

  def create_order
    data = @builder.payload
    @order = Order.create(data)
  end

  def order_params
    params.permit(
      :id,
      :store_id,
      :date_created,
      :date_closed,
      :last_updated,
      :total_amount,
      :total_shipping,
      :total_amount_with_shipping,
      :paid_amount,
      :expiration_date,
      :total_shipping,
      :status,
      order_items: [
        { item: %i[id title] },
          :quantity,
          :unit_price,
          :full_unit_price,
      ],
      payments: [
          :id,
          :order_id,
          :payer_id,
          :installments,
          :payment_type,
          :status,
          :transaction_amount,
          :taxes_amount,
          :shipping_cost,
          :total_paid_amount,
          :installment_amount,
          :date_approved,
          :date_created,
      ],
      shipping: [
        :id,
        :shipment_type,
        :date_created,
        receiver_address: [
          :id,
          :address_line,
          :street_name,
          :street_number,
          :comment,
          :zip_code,
          :latitude,
          :longitude,
          :receiver_phone,
          city: [:name],
          state: [:name],
          country: [:id, :name],
          neighborhood: [:id, :name],
        ]
      ],
      buyer: [
        :id,
        :first_name,
        :last_name,
        :nickname,
        :email,
        phone: [:area_code, :number],
        billing_info: [:doc_type, :doc_number],
      ],
    )
  end
end
