class AddKilledAtToKillmails < ActiveRecord::Migration[5.1]
  def change
    add_column :killmails, :killed_at, :datetime
  end
end
