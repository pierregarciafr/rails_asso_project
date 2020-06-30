class CreateDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :details do |t|
      t.text :description
      t.references :detailable, polymorphic: true, index: true, null: false

      t.timestamps
    end
  end
end
