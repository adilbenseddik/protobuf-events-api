require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ProtobufEventApi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

    # Configure Google Protobuf Mapper.
    config.to_prepare do
      event_store = Rails.configuration.event_store = RailsEventStore::Client.new(
        repository: RailsEventStoreActiveRecord::EventRepository.new(
          mapper: RubyEventStore::Mappers::Protobuf.new
        )
      )

      # Register Protobuf Event Handlers.
      # NOTE: All event subscription must be layed out here.
      #
      #   => store events
      event_store.subscribe(OrderPlacedService.new, to: [ProtobufEvents::OrderPlaced])
      event_store.subscribe(OrderCanceledService.new, to: [ProtobufEvents::OrderCanceled])
      event_store.subscribe(OrderConfirmedService.new, to: [ProtobufEvents::OrderConfirmed])
      event_store.subscribe(OrderValidatedService.new, to: [ProtobufEvents::OrderValidated])
      event_store.subscribe(OrderRefusedService.new, to: [ProtobufEvents::OrderRefused])
      #
      #   => shipping events
      event_store.subscribe(OrderShippedService.new, to: [ProtobufEvents::OrderShipped])
      event_store.subscribe(OrderTrackedService.new, to: [ProtobufEvents::OrderTracked])
      event_store.subscribe(OrderDeliveredService.new, to: [ProtobufEvents::OrderDelivered])
      event_store.subscribe(OrderFailedService.new, to: [ProtobufEvents::OrderFailed])
      #
      #   =>  creator events
      event_store.subscribe(OrderReportedService.new, to: [ProtobufEvents::OrderReported])
      event_store.subscribe(OrderReceivedService.new, to: [ProtobufEvents::OrderReceived])
      event_store.subscribe(OrderReturnedService.new, to: [ProtobufEvents::OrderReturned])
      event_store.subscribe(OrderReviewedService.new, to: [ProtobufEvents::OrderReviewed])
      #
      #   => backoffice.
      event_store.subscribe(OrderAnnotatedService.new, to: [ProtobufEvents::OrderAnnotated])
      event_store.subscribe(OrderFlaggedService.new, to: [ProtobufEvents::OrderFlagged])
      event_store.subscribe(OrderArchivedService.new, to: [ProtobufEvents::OrderArchived])
    end

    # Require protobuf event models.
    Dir["#{Rails.root}/lib/*_pb.rb"].each { |file| require file }

    # TODO: setup EventLogger as default logger.
    config.logger = Logger.new(STDOUT)
  end
end
