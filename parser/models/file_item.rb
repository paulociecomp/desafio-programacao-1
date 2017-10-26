class FileItem
  attr_reader :purchaser_name,
                :item_description,
                :item_price,
                :purchase_count,
                :merchant_address,
                :merchant_name

  def initialize(arrAttributes)
    @purchaser_name = arrAttributes[0]
    @item_description = arrAttributes[1]
    @item_price = arrAttributes[2]
    @purchase_count = arrAttributes[3]
    @merchant_address = arrAttributes[4]
    @merchant_name = arrAttributes[5].delete("\n")
  end
end
