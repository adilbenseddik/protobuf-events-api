require 'test_helper'

class OrderReceivedControllerTest < ActionDispatch::IntegrationTest
  test "POST api_v3_orders_order_received" do

    post api_v3_orders_order_received_url,
      params: order_received_params
    assert_response :success

  end

  test "PUT/PATCH api_v3_orders_order_received" do

    put api_v3_orders_order_received_url(
      { id: SecureRandom.uuid }
    ), params: order_received_params
    assert_response :success

    put api_v3_orders_order_received_url(
      { id: SecureRandom.uuid }
    ), params: {}
    assert_response(422)

    patch api_v3_orders_order_received_url(
      { id: SecureRandom.uuid }
    ), params: order_received_params
    assert_response :success

  end

  test "GET api_v3_orders_order_received" do

    get api_v3_orders_order_received_url({ id: SecureRandom.uuid })
    assert_response :success

  end

  private

  def order_received_params
    {
      order_received: {
        event_id: SecureRandom.uuid,
        creator_id: SecureRandom.uuid,
        order_id: SecureRandom.uuid,
        brand_id: SecureRandom.uuid,
        product_id: SecureRandom.uuid,
      }
    }
  end
end
