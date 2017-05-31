class AddFieldToRogues < ActiveRecord::Migration
  def change
    add_column :rogues, :talent, :string
  end
end
