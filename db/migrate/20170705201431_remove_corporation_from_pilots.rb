class RemoveCorporationFromPilots < ActiveRecord::Migration[5.1]
  def change
    remove_column(:pilots, :corporation, :string)
  end
end
