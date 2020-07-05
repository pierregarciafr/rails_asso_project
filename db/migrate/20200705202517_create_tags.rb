class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.references :asso, null: false, foreign_key: true
      t.references :field, null: false, foreign_key: true

      t.timestamps
    end
    add_index :tags, [:asso_id, :field_id], unique: true
  end
end
