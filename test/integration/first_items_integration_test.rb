# this is the first example for an integration test using plain minitest syntax
# with capybara.

require "test_helper"

class ItemIndexTest < ActionDispatch::IntegrationTest
  test "has the right header" do
    visit items_path
    assert page.has_content?('Listing items')
  end
end

class ItemIndexTestWithTwoItems < ActionDispatch::IntegrationTest
  setup do
    item1 = Item.create!( :text => "one item")
    item2 = Item.create!( :text => "another item")
  end

  test "shows all items" do
    visit items_path
    assert page.has_content?("one item")
    assert page.has_content?("another item")
    refute page.has_content?("item not in database")
  end

  test "has link to item page" do
    visit items_path
    within(:xpath,"//tbody/tr[3]") do
      click_on('Show')
    end
    #save_and_open_page
    assert page.has_content?('one item')
  end
end

