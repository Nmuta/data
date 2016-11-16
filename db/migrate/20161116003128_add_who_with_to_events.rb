class AddWhoWithToEvents < ActiveRecord::Migration
  def change
    add_column :events, :who_with_id, :integer
  end

end
