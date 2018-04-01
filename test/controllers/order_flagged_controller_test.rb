require 'test_helper'

class OrderFlaggedControllerTest < ActionDispatch::IntegrationTest
  test "POST api_v3_orders_order_flagged" do

    post api_v3_orders_order_flagged_url,
      params: order_flagged_params
    assert_response :success

    post api_v3_orders_order_flagged_url,
      params: {}
    assert_response(422)

  end

  test "PUT/PATCH api_v3_orders_order_flagged" do

    put api_v3_orders_order_flagged_url(
      { id: SecureRandom.uuid }
    ), params: order_flagged_params
    assert_response :success

    put api_v3_orders_order_flagged_url(
      { id: SecureRandom.uuid }
    ), params: {}
    assert_response(422)

    patch api_v3_orders_order_flagged_url(
      { id: SecureRandom.uuid }
    ), params: order_flagged_params
    assert_response :success

  end

  test "GET api_v3_orders_order_flagged" do

    get api_v3_orders_order_flagged_url({ id: SecureRandom.uuid })
    assert_response :success

  end

  private

  def order_flagged_params
    {
      order_flagged: {
        event_id: SecureRandom.uuid,
        creator_id: SecureRandom.uuid,
        order_id: SecureRandom.uuid,
        brand_id: SecureRandom.uuid,
        product_id: SecureRandom.uuid,
      }
    }
  end
end
