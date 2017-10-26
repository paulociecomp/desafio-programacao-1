require "minitest/autorun"
require "./models/file_item"

class TestFileItem < Minitest::Test
  def test_attributes
    arrLine = ["João Silva", "R$10 off R$20 of food", "10.0", "2", "987 Fake St", "Bob's Pizza\n"]
    fileItem = FileItem.new(arrLine)

    assert_equal "João Silva", fileItem.purchaser_name
    assert_equal "R$10 off R$20 of food", fileItem.item_description
    assert_equal "10.0", fileItem.item_price
    assert_equal "2", fileItem.purchase_count
    assert_equal "987 Fake St", fileItem.merchant_address
    assert_equal "Bob's Pizza", fileItem.merchant_name
  end
end
