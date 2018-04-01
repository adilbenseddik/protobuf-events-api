class OrderShipped < RubyEventStore::Event
  # NOTE:
  # Definitions for each event type are placed in 'app/definitions'
  # Ruby classes are generated with Google Protobuf ans placed in the
  # 'lib' directory.
  #
  # protoc -I app/definitions --ruby_out ./lib app/definitions/order_shipped.proto3
  #
end
