class Api::V3::Orders::OrderReportedController < ApplicationController
  # EXEMPLE:
  #
  # curl -X POST 'http://localhost:3000/api/v3/orders/order_reported'
  #   -d '{"event_id":"4793f13a-85a5-4dec-a1db-08a76280c7fb",
  #        "creator_id":"4793f13a-85a5-4dec-a1db-08a76280c7fb",
  #        "order_id":"4793f13a-85a5-4dec-a1db-08a76280c7fb"}'
  #   -H "Content-Type: application/json"
  #
  def create
    event = ProtobufEvents::OrderReported.
      new(Hash(order_reported_params))

    event_store.publish_event(
      event,
      stream_name: "OrderReported$#{event.order_id}",
    )

    render json: {
      status: 'ORDER_REPORTED',
      event: event,
    }
  rescue => exception
    render status: :unprocessable_entity,
      json: {
        status: 'ORDER_REPORTED_ERROR',
        event: event,
        description: exception.message.underscore.upcase,
      }
  end

  def update
    event = ProtobufEvents::OrderReported.
      new(Hash(order_reported_params))

    event_store.append_to_stream(
      event,
      stream_name: "OrderReported$#{event.order_id}",
    )

    render json: {
      status: 'ORDER_REPORTED_UPDATED',
      event: event,
    }
  rescue => exception
    render status: :unprocessable_entity,
      json: {
        status: 'ORDER_REPORTED_ERROR',
        event: event,
        description: exception.message.underscore.upcase,
      }
  end

  def show
    stream = "OrderReported-#{params[:id]}"
    events = event_store.read_events_forward(
      stream, start: :head, count: 42
    )
    render json: {
      events_count: events.count,
      payload: events,
    }
  end

  private

  def order_reported_params
    params.require(:order_reported).permit(
      :event_id,
      :creator_id,
      :order_id,
      :brand_id,
      :product_id,
    )
  end
end
