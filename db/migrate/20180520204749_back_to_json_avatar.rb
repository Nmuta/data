class BackToJsonAvatar < ActiveRecord::Migration
  def change
    change_column :users, :avatar_cache, :json, using: 'avatar_cache::JSON'
  end
end