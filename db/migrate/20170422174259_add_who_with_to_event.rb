class AddWhoWithToEvent < ActiveRecord::Migration
  def change
    add_column :events, :who_with, :string
  end
end
