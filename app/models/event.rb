class Event < ActiveRecord::Base
  belongs_to :emotion
  belongs_to :user


  enum time_of_day: [:before_school, :morning, :lunch, :afternoon, :after_school, :evening]


end


