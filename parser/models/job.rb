class Job < ActiveRecord::Base
  has_many :purchases

  def revenue
    purchases.sum(&:price)
  end
end
