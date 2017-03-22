class CreateSecondaries < ActiveRecord::Migration
  def change
    create_table :secondaries do |t|
      t.string :name
      t.integer :emotion_id

      t.timestamps null: false
    end
  end
end
