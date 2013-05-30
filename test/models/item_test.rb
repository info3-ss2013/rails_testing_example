require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  test "the truth" do
    item = Item.new
    assert item.sayhello == "Hello"
  end
end

