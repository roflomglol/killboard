class CreateRegions < ActiveRecord::Migration[4.2]
  def change
    create_table :regions do |t|
      t.string  :name,     index: true
      t.integer :crest_id, index: true
      t.string  :crest_url

      t.timestamps null: false
    end
  end
end
