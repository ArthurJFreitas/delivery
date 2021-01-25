require 'test_helper'

class PaymentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @payment = payments(:one)
  end

  test "should get index" do
    get payments_url, as: :json
    assert_response :success
  end

  test "should create payment" do
    assert_difference('Payment.count') do
      post payments_url, params: { payment: { order_id: @payment.order_id, type: @payment.type, value: @payment.value } }, as: :json
    end

    assert_response 201
  end

  test "should show payment" do
    get payment_url(@payment), as: :json
    assert_response :success
  end

  test "should update payment" do
    patch payment_url(@payment), params: { payment: { order_id: @payment.order_id, type: @payment.type, value: @payment.value } }, as: :json
    assert_response 200
  end

  test "should destroy payment" do
    assert_difference('Payment.count', -1) do
      delete payment_url(@payment), as: :json
    end

    assert_response 204
  end
end
