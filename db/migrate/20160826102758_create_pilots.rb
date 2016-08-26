class CreatePilots < ActiveRecord::Migration[5.0]
  def change
    create_table :pilots do |t|
      t.string :name
      t.string :corporation
      t.string :alliance

      t.timestamps
    end

    add_index :pilots, :name, unique: true
    add_index :pilots, :corporation
    add_index :pilots, :alliance
  end
end
