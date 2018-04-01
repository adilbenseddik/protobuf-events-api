require 'test_helper'

class BackofficeControllerTest < ActionDispatch::IntegrationTest
  #
  # TODO: find a way to generate or stub svent stores and streams
  # without using RSpec Matchers.
  test "GET api_v3_orders_backoffice_all_streams" do

    get api_v3_orders_root_url
    assert_response :success

  end

  test "GET api_v3_orders_backoffice_all_stream_events_forward" do

    get api_v3_orders_read_forward_url
    assert_response :success

  end

  test "GET api_v3_orders_backoffice_all_stream_events_backward" do

    get api_v3_orders_read_backward_url
    assert_response :success

  end
end
