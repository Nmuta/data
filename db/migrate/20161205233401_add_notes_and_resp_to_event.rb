class AddNotesAndRespToEvent < ActiveRecord::Migration
  def change
    add_column :events, :my_response, :string
    add_column :events, :notes, :string
  end
end
