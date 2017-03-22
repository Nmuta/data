class Emotion < ActiveRecord::Base

  belongs_to :partner
  has_many :secondaries
  has_many :tertiaries
  has_many :reponses

end
