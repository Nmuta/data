class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.string :tip
      t.integer :user_id
      t.integer :frequency
      t.integer :icon_id

      t.timestamps null: false
    end
  end
end
