class AddTimeOfDayToEvent < ActiveRecord::Migration
  def change
    add_column :events, :time_of_day, :integer
  end
end
