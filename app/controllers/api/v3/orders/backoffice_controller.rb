class Api::V3::Orders::BackofficeController < ApplicationController
  # NOTE:
  # => backoffice request for extractions should be set here.
  # => Auth methods should be set here accordingly.
  #
  def index
    streams = event_store.get_all_streams
    render json: {
      streams_count: streams.count,
      payload: streams,
    }
  end

  def read_forward
    stream = "Order#{params[:event_type]&.titlecase}$#{params[:id]}"
    events = event_store.read_events_forward(
      stream,
      start: (params[:event_id] or :head),
      count: (params[:limit] or 42),
    )
    render json: {
      events_count: events.count,
      payload: events,
      read: 'FORWARD',
    }
  end

  def read_backward
    stream = "Order#{params[:event_type]&.titlecase}$#{params[:id]}"
    events = event_store.read_events_backward(
      stream,
      start: (params[:event_id] or :head),
      count: (params[:limit] or 42),
    )
    render json: {
      events_count: events.count,
      payload: events,
      read: 'FORWARD',
    }
  end

  def show
  end
end
