class OrderCanceledService
  def call(event)
    # TODO:
    # Process your canceled order.
    #   Exemple:
    #    => call notification api
    #    => process event data
    #    => build up your report service
    Rails.logger.info(event.event_id)
  end
end
