class CreateAssos < ActiveRecord::Migration[6.0]
  def change
    create_table :assos do |t|
      t.string :register
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
