class Purchase < ActiveRecord::Base
  extend Forwardable

  belongs_to :purchaser
  belongs_to :item
  belongs_to :merchant

  def_delegator :item, :price

end
