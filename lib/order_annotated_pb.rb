# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: order_annotated.proto3

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "protobuf_events.OrderAnnotated" do
    optional :event_id, :string, 1
    optional :order_id, :string, 2
    optional :creator_id, :string, 3
    optional :brand_id, :string, 4
    optional :product_id, :string, 5
  end
end

module ProtobufEvents
  OrderAnnotated = Google::Protobuf::DescriptorPool.generated_pool.lookup("protobuf_events.OrderAnnotated").msgclass
end