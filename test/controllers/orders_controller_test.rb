require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get orders_url, as: :json
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post orders_url, params: { order: { city: @order.city, complement: @order.complement, country: @order.country, deliveryFee: @order.deliveryFee, district: @order.district, dtOrderCreate: @order.dtOrderCreate, exernalCode: @order.exernalCode, latitude: @order.latitude, longitude: @order.longitude, number: @order.number, postalCode: @order.postalCode, state: @order.state, storeId: @order.storeId, street: @order.street, subTotal: @order.subTotal, total: @order.total, total_shipping: @order.total_shipping } }, as: :json
    end

    assert_response 201
  end

  test "should show order" do
    get order_url(@order), as: :json
    assert_response :success
  end

  test "should update order" do
    patch order_url(@order), params: { order: { city: @order.city, complement: @order.complement, country: @order.country, deliveryFee: @order.deliveryFee, district: @order.district, dtOrderCreate: @order.dtOrderCreate, exernalCode: @order.exernalCode, latitude: @order.latitude, longitude: @order.longitude, number: @order.number, postalCode: @order.postalCode, state: @order.state, storeId: @order.storeId, street: @order.street, subTotal: @order.subTotal, total: @order.total, total_shipping: @order.total_shipping } }, as: :json
    assert_response 200
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete order_url(@order), as: :json
    end

    assert_response 204
  end
end
