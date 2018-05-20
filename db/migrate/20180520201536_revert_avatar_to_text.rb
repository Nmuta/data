class RevertAvatarToText < ActiveRecord::Migration
  def change
    change_column :users, :avatar_cache, :string
  end
end