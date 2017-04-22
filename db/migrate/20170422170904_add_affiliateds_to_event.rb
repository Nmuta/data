class AddAffiliatedsToEvent < ActiveRecord::Migration
  def change
    add_column :events, :secondary, :string
    add_column :events, :tertiary, :string
  end
end
