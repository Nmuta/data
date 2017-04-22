class ChangeTodToString < ActiveRecord::Migration
  def change
    change_column :events, :time_of_day, :string
  end
end
