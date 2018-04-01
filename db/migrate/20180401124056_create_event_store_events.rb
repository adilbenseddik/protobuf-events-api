class CreateEventStoreEvents < ActiveRecord::Migration[5.1]
  def change
    enable_extension :pgcrypto

    create_table :event_store_events_in_streams, force: false do |t|
      t.string :stream, null: false
      t.integer :position, null: true
      t.references :event, null: false, type: :uuid
      t.datetime :created_at, null: false
    end
    add_index :event_store_events_in_streams, [:stream, :position], unique: true
    add_index :event_store_events_in_streams, [:created_at]
    add_index :event_store_events_in_streams, [:stream, :event_id], unique: true

    create_table(:event_store_events, id: :uuid, default: 'gen_random_uuid()', force: false) do |t|
      t.string :event_type, null: false
      t.text :metadata
      t.text :data, null: false
      t.datetime :created_at, null: false
    end
    add_index :event_store_events, :created_at
  end
end
