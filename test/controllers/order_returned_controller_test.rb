require 'test_helper'

class OrderReturnedControllerTest < ActionDispatch::IntegrationTest
  test "POST api_v3_orders_order_returned" do

    post api_v3_orders_order_returned_url,
      params: order_returned_params
    assert_response :success

    post api_v3_orders_order_returned_url,
      params: {}
    assert_response(422)

  end

  test "PUT/PATCH api_v3_orders_order_returned" do

    put api_v3_orders_order_returned_url(
      { id: SecureRandom.uuid }
    ), params: order_returned_params
    assert_response :success

    put api_v3_orders_order_returned_url(
      { id: SecureRandom.uuid }
    ), params: {}
    assert_response(422)

    patch api_v3_orders_order_returned_url(
      { id: SecureRandom.uuid }
    ), params: order_returned_params
    assert_response :success

  end

  test "GET api_v3_orders_order_returned" do

    get api_v3_orders_order_returned_url({ id: SecureRandom.uuid })
    assert_response :success

  end

  private

  def order_returned_params
    {
      order_returned: {
        event_id: SecureRandom.uuid,
        creator_id: SecureRandom.uuid,
        order_id: SecureRandom.uuid,
        brand_id: SecureRandom.uuid,
        product_id: SecureRandom.uuid,
      }
    }
  end
end
