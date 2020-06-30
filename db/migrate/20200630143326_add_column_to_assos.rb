class AddColumnToAssos < ActiveRecord::Migration[6.0]
  def change
    add_column :assos, :name, :string
  end
end
