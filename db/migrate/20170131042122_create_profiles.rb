class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.integer :hair_choice
      t.string :skin_tone
      t.integer :facebase
      t.integer :nose
      t.integer :glasses
      t.integer :moustache
      t.boolean :active

      t.timestamps null: false
    end
  end
end
