class Payload::Builder
    attr_reader :data
  
    def initialize(data)
      @data = Payload::Parser.new(data)
    end

    def payload_camel_case
      camel_case_payload.merge!({ total_shipping: data.total_shipping }).to_json
    end

    def camel_case_payload
      payload.deep_transform_keys! do |key|
        key.to_s.gsub('attributes', '').camelize(:lower)
      end
    end
  
    def payload
      {
        external_code: data.external_code,
        store_id: data.store_id,
        sub_total: data.sub_total,
        delivery_fee: data.delivery_fee,
        total: data.total,
        country: data.country,
        state: data.state,
        city: data.city,
        district: data.district,
        street: data.street,
        complement: data.complement,
        longitude: data.longitude,
        latitude: data.latitude,
        dt_order_create: data.dt_order_create,
        number: data.number,
        postal_code: data.postal_code,
        customer_attributes: data.customer,
        payments_attributes: data.payments,
        items_attributes: data.items,
      }
    end
  end