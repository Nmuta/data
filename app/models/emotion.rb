class Emotion < ActiveRecord::Base

  belongs_to :partner
  has_many :secondaries
  has_many :tertiaries
  has_many :responses


  def self.bulk_add(stringified_class, emotion_id, text)
    array_of_words = text.strip.split(":")
    clazz = stringified_class.constantize

    array_of_words.each do |arr|
      clazz.create(name: arr.strip, emotion_id: emotion_id) ?  true : false
    end

  end

end
