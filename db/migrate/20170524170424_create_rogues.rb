class CreateRogues < ActiveRecord::Migration
  def change
    create_table :rogues do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
