class RenameNoseToEarrings < ActiveRecord::Migration
  def change
    rename_column :profiles, :nose, :earrings
  end
end
