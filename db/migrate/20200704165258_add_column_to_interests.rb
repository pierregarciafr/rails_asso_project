class AddColumnToInterests < ActiveRecord::Migration[6.0]
  def change
    add_column :interests, :my_research, :integer
  end
end
