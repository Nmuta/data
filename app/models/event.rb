class Event < ActiveRecord::Base
  belongs_to :emotion
  belongs_to :user
  belongs_to :partner

  enum time_of_day: [:before_school, :morning, :afternoon, :after_school, :evening]
end
