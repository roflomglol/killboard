class CreateSystems < ActiveRecord::Migration[4.2]
  def change
    create_table :systems do |t|
      t.string :name
      t.integer :region_id
      t.string :crest_url
      t.integer :crest_id
      t.decimal :security_status, precision: 2, scale: 1

      t.timestamps null: false
    end

    add_index :systems, :name
    add_index :systems, :crest_id
    add_index :systems, :region_id
  end
end
