require 'test_helper'

class OrderConfirmedControllerTest < ActionDispatch::IntegrationTest
  test "POST api_v3_orders_order_confirmed" do

    post api_v3_orders_order_confirmed_url,
      params: order_confirmed_params
    assert_response :success

    post api_v3_orders_order_confirmed_url,
      params: {}
    assert_response(422)

  end

  test "PUT/PATCH api_v3_orders_order_confirmed" do

    put api_v3_orders_order_confirmed_url(
      { id: SecureRandom.uuid }
    ), params: order_confirmed_params
    assert_response :success

    put api_v3_orders_order_confirmed_url(
      { id: SecureRandom.uuid }
    ), params: {}
    assert_response(422)

    patch api_v3_orders_order_confirmed_url(
      { id: SecureRandom.uuid }
    ), params: order_confirmed_params
    assert_response :success

  end

  test "GET api_v3_orders_order_confirmed" do

    get api_v3_orders_order_confirmed_url({ id: SecureRandom.uuid })
    assert_response :success

  end

  private

  def order_confirmed_params
    {
      order_confirmed: {
        event_id: SecureRandom.uuid,
        creator_id: SecureRandom.uuid,
        order_id: SecureRandom.uuid,
        brand_id: SecureRandom.uuid,
        product_id: SecureRandom.uuid,
      }
    }
  end
end
