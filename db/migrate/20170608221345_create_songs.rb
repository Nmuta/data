class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :artist
      t.string :songTitle
      t.string :songLength, :limit => 6
      t.string :comments

      t.timestamps null: false
    end
  end
end
