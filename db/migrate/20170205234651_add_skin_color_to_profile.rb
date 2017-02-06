class AddSkinColorToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :hair_color, :string
  end
end
