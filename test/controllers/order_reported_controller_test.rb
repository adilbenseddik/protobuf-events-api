require 'test_helper'

class OrderReportedControllerTest < ActionDispatch::IntegrationTest
  test "POST api_v3_orders_order_reported" do

    post api_v3_orders_order_reported_url,
      params: order_reported_params
    assert_response :success

    post api_v3_orders_order_reported_url,
      params: {}
    assert_response(422)

  end

  test "PUT/PATCH api_v3_orders_order_reported" do

    put api_v3_orders_order_reported_url(
      { id: SecureRandom.uuid }
    ), params: order_reported_params
    assert_response :success

    put api_v3_orders_order_reported_url(
      { id: SecureRandom.uuid }
    ), params: {}
    assert_response(422)

    patch api_v3_orders_order_reported_url(
      { id: SecureRandom.uuid }
    ), params: order_reported_params
    assert_response :success

  end

  test "GET api_v3_orders_order_reported" do

    get api_v3_orders_order_reported_url({ id: SecureRandom.uuid })
    assert_response :success

  end

  private

  def order_reported_params
    {
      order_reported: {
        event_id: SecureRandom.uuid,
        creator_id: SecureRandom.uuid,
        order_id: SecureRandom.uuid,
        brand_id: SecureRandom.uuid,
        product_id: SecureRandom.uuid,
      }
    }
  end
end
