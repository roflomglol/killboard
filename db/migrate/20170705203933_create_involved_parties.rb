class CreateInvolvedParties < ActiveRecord::Migration[5.1]
  def change
    create_table :involved_parties do |t|
      t.integer :pilot_id
      t.integer :killmail_id

      t.timestamps
    end
  end
end
