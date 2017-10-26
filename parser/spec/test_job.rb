require "minitest/autorun"
ENV['RACK_ENV']='test'
require "sinatra/activerecord"
require "./models/wrapper"
require "./models/parser"
require "./models/purchaser"
require "./models/item"
require "./models/merchant"
require "./models/purchase"
require "./models/job"

class TestJob < Minitest::Test
  def setup
    Purchase.destroy_all
    Purchaser.destroy_all
    Item.destroy_all
    Merchant.destroy_all
    Job.destroy_all

    parser = Parser.new("spec/support/example_input.tab")
    parser.setup
  end

  def test_create_job
    job = Job.first
    purchase = Purchase.find_by(count: 1)

    assert_equal purchase, job.purchases.find_by(count: 1)
  end

  def test_revenue_by_file
    job = Job.first

    assert_equal 30.0, job.revenue
  end
end
