class RenameWhoWith < ActiveRecord::Migration
  def change
    rename_column :events, :who_with_id, :partner_id
  end
end
