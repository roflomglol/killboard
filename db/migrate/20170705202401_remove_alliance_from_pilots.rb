class RemoveAllianceFromPilots < ActiveRecord::Migration[5.1]
  def change
    remove_column(:pilots, :alliance, :string)
  end
end
