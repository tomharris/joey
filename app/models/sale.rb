class Sale < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :user
  validates_presence_of :sub_total

  def total
    self.sub_total + self.tax
  end
end
