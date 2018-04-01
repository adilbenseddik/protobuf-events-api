class Api::V3::Orders::OrderReviewedController < ApplicationController
  # EXEMPLE:
  #
  # curl -X POST 'http://localhost:3000/api/v3/orders/order_reviewed'
  #   -d '{"event_id":"4793f13a-85a5-4dec-a1db-08a76280c7fb",
  #        "creator_id":"4793f13a-85a5-4dec-a1db-08a76280c7fb",
  #        "order_id":"4793f13a-85a5-4dec-a1db-08a76280c7fb"}'
  #   -H "Content-Type: application/json"
  #
  def create
    event = ProtobufEvents::OrderReviewed.
      new(Hash(order_reviewed_params))

    event_store.publish_event(
      event,
      stream_name: "OrderReviewed$#{event.order_id}",
    )

    render json: {
      status: 'ORDER_REVIEWED',
      event: event,
    }
  rescue => exception
    render status: :unprocessable_entity,
      json: {
        status: 'ORDER_REVIEWED_ERROR',
        event: event,
        description: exception.message.underscore.upcase,
      }
  end

  def update
    event = ProtobufEvents::OrderReviewed.
      new(Hash(order_reviewed_params))

    event_store.append_to_stream(
      event,
      stream_name: "OrderReviewed$#{event.order_id}",
    )

    render json: {
      status: 'ORDER_REVIEWED_UPDATED',
      event: event,
    }
  rescue => exception
    render status: :unprocessable_entity,
      json: {
        status: 'ORDER_REVIEWED_ERROR',
        event: event,
        description: exception.message.underscore.upcase,
      }
  end

  def show
    stream = "OrderReviewed-#{params[:id]}"
    events = event_store.read_events_forward(
      stream, start: :head, count: 42
    )
    render json: {
      events_count: events.count,
      payload: events,
    }
  end

  private

  def order_reviewed_params
    params.require(:order_reviewed).permit(
      :event_id,
      :creator_id,
      :order_id,
      :brand_id,
      :product_id,
    )
  end
end
