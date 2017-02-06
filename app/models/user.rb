class User < ActiveRecord::Base
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  belongs_to :campus
  has_many :events
  has_many :profiles

  def active_profile
    self.profiles  ?  self.profiles.first  : nil
  end

end
