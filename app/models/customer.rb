class Customer < ActiveRecord::Base
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :balance

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
