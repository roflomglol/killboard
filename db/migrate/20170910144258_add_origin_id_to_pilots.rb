class AddOriginIdToPilots < ActiveRecord::Migration[5.1]
  def change
    add_column :pilots, :origin_id, :integer
    add_index :pilots, :origin_id, unique: true
  end
end
