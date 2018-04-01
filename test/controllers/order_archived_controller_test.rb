require 'test_helper'

class OrderArchivedControllerTest < ActionDispatch::IntegrationTest
  test "POST api_v3_orders_order_archived" do

    post api_v3_orders_order_archived_url,
      params: order_archived_params
    assert_response :success

    post api_v3_orders_order_archived_url,
      params: {}
    assert_response(422)

  end

  test "PUT/PATCH api_v3_orders_order_archived" do

    put api_v3_orders_order_archived_url(
      { id: SecureRandom.uuid }
    ), params: order_archived_params
    assert_response :success

    put api_v3_orders_order_archived_url(
      { id: SecureRandom.uuid }
    ), params: {}
    assert_response(422)

    patch api_v3_orders_order_archived_url(
      { id: SecureRandom.uuid }
    ), params: order_archived_params
    assert_response :success

  end

  test "GET api_v3_orders_order_archived" do

    get api_v3_orders_order_archived_url({ id: SecureRandom.uuid })
    assert_response :success

  end

  private

  def order_archived_params
    {
      order_archived: {
        event_id: SecureRandom.uuid,
        creator_id: SecureRandom.uuid,
        order_id: SecureRandom.uuid,
        brand_id: SecureRandom.uuid,
        product_id: SecureRandom.uuid,
      }
    }
  end
end
