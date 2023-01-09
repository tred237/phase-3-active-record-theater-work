class Role < ActiveRecord::Base
  has_many :auditions

  def actors
    self.auditions.map{|i| i.actor}
  end

  def locations
    self.auditions.map{|i| i.location}
  end

  def lead
    first_audition = self.auditions.find_by(hired: true)
    !!first_audition ? first_audition : "no actor has been hired for this role"
  end 

  def understudy
    second_audition = self.auditions.where(hired: true).second
    !!second_audition ? second_audition : "no actor has been hired for understudy for this role"
  end 
end