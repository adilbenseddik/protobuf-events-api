require 'test_helper'

class OrderShippedControllerTest < ActionDispatch::IntegrationTest
  test "POST api_v3_orders_order_shipped" do

    post api_v3_orders_order_shipped_url,
      params: order_shipped_params
    assert_response :success

    post api_v3_orders_order_shipped_url,
      params: {}
    assert_response(422)

  end

  test "PUT/PATCH api_v3_orders_order_shipped" do

    put api_v3_orders_order_shipped_url(
      { id: SecureRandom.uuid }
    ), params: order_shipped_params
    assert_response :success

    put api_v3_orders_order_shipped_url(
      { id: SecureRandom.uuid }
    ), params: {}
    assert_response(422)

    patch api_v3_orders_order_shipped_url(
      { id: SecureRandom.uuid }
    ), params: order_shipped_params
    assert_response :success

  end

  test "GET api_v3_orders_order_shipped" do

    get api_v3_orders_order_shipped_url({ id: SecureRandom.uuid })
    assert_response :success

  end

  private

  def order_shipped_params
    {
      order_shipped: {
        event_id: SecureRandom.uuid,
        creator_id: SecureRandom.uuid,
        order_id: SecureRandom.uuid,
        brand_id: SecureRandom.uuid,
        product_id: SecureRandom.uuid,
      }
    }
  end
end
