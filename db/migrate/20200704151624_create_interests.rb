class CreateInterests < ActiveRecord::Migration[6.0]
  def change
    create_table :interests do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :couple_status

      t.timestamps
    end
  end
end
