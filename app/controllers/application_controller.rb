class ApplicationController < ActionController::API
  include ProtobufEvents

  protected

  def event_store
    Rails.configuration.event_store
  end
end
