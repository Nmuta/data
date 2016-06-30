class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :user_id
      t.integer :emotion_id
      t.timestamp :logged_time

      t.timestamps null: false
    end
  end
end
