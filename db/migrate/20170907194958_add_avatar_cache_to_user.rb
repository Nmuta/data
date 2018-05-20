class AddAvatarCacheToUser < ActiveRecord::Migration
  def change
    add_column :users, :avatar_cache, :string
  end
end
