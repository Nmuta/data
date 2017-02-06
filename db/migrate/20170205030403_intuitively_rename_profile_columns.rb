class IntuitivelyRenameProfileColumns < ActiveRecord::Migration
  def change
    rename_column :profiles, :skin_tone, :skin
    rename_column :profiles, :hair_choice, :hair

  end
end
