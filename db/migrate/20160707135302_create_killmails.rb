class CreateKillmails < ActiveRecord::Migration[5.0]
  def change
    create_table :killmails do |t|
      t.text :body

      t.timestamps
    end
  end
end
