class Campus < ActiveRecord::Base
  self.table_name = "campuses"
  self.primary_key = "id"

  has_many :users

end
