require "minitest/autorun"
ENV['RACK_ENV']='test'
require "sinatra/activerecord"
require "./models/wrapper"
require "./models/parser"
require "./models/purchaser"
require "./models/item"
require "./models/merchant"
require "./models/purchase"

class TestParser < Minitest::Test
  def setup
    Purchase.destroy_all
    Purchaser.destroy_all
    Item.destroy_all
    Merchant.destroy_all
  end

  def test_create_purchase
    parser = Parser.new("spec/support/example_input.tab")
    parser.create_purchases

    purchaser = Purchaser.find_by(name: "Marty McFly")
    item = Item.find_by(description: 'R$20 Sneakers for R$5')
    merchant = Merchant.find_by(name: "Sneaker Store Emporium")

    purchase = Purchase.find_by(count: 1)

    assert_equal purchaser, purchase.purchaser
    assert_equal item, purchase.item
    assert_equal merchant, purchase.merchant
    assert_equal 1, purchase.count
  end
end
