class AddOriginIdToKillmails < ActiveRecord::Migration[5.1]
  def change
    add_column :killmails, :origin_id, :integer
  end
end
