class Parser

  def initialize(path)
    @wrapper = Wrapper.new(path)
    @purchases = []
  end

  def setup
    create_purchases
    Job.create!(purchases: purchases)
  end

  def create_purchases
    @wrapper.items.each do |wrapper_item|

      purchaser = Purchaser.create(name: wrapper_item.purchaser_name)
      item = Item.create(
        description: wrapper_item.item_description,
        price: wrapper_item.item_price
      )
      merchant = Merchant.create(
        name: wrapper_item.merchant_name,
        address: wrapper_item.merchant_address
      )
      purchases << Purchase.create(
        purchaser: purchaser,
        item: item,
        merchant: merchant,
        count: wrapper_item.purchase_count
      )

    end
  end

  private

  attr_reader :purchases
end
