class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :event_name
      t.references :eventable, polymorphic: true, index: true, null: false # null: flase an event has an owner

      t.timestamps
    end
  end
end
