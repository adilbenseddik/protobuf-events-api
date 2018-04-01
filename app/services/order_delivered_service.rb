class OrderDeliveredService
  def call(event)
    # TODO:
    # Process your order event here.
    #   Exemple:
    #    => call notification api
    #    => process event data
    #    => build up your report service
    Rails.logger.info(event.event_id)
  end
end
