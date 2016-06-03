class AddAvatarToTips < ActiveRecord::Migration
    def up
      add_attachment :tips, :tip_image
    end

    def down
      remove_attachment :tips, :tip_image
    end
end
