class CreateFruits < ActiveRecord::Migration
  def change
    create_table :fruits do |t|
      t.string :name
      t.string :region
      t.integer :code

      t.timestamps null: false
    end
  end
end
