require "minitest/autorun"
require "./models/wrapper"

class TestWrapper < Minitest::Test

  def setup
    @wrapper = Wrapper.new("spec/support/example_input.tab")
  end

  def test_file_path
    assert_equal "spec/support/example_input.tab", @wrapper.file_path
  end

  def test_items_count
    assert_equal 4, @wrapper.items.count
  end

  def test_first_item
    assert_equal "João Silva", @wrapper.items.first.purchaser_name
    assert_equal "Sneaker Store Emporium", @wrapper.items.last.merchant_name
  end

end
