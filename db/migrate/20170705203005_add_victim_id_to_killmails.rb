class AddVictimIdToKillmails < ActiveRecord::Migration[5.1]
  def change
    add_column :killmails, :victim_id, :integer
  end
end
