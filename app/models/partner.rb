class Partner < ActiveRecord::Base

  has_many :events

  def get_person_by_id(who_with_id)
    person = Person.where(id: who_with_id)
    found = person ? person.first.name : null
  end

  def get_person_by_name(who_with)
    person = Person.where(name: who_with)
    found = person ? person.first.id : null
  end
end
