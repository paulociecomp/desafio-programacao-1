class AddJobToPurchase < ActiveRecord::Migration[5.1]
  def change
    add_reference :purchases, :job
  end
end
