class RenameReponsesTableDoh < ActiveRecord::Migration
  def change
    rename_table :reponses, :responses
  end
end
