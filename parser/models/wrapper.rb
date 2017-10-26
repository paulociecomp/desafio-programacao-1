require "./models/file_item"

class Wrapper
  attr_accessor :file_path, :items

  def initialize(path)
    @file_path = path
    @items = []
    setup
  end

  def setup
    File.open(file_path).each do |line|
      items << FileItem.new(line.split("\t"))
    end

    items.shift
  end

  private
  attr_reader :item
end
