# this is the third integration test example using
# gem 'minitest-spec-rails'


require "test_helper"

describe "Item Page Integration Test" do

  it "has the right header" do
    visit items_path
    page.must_have_content('Listing items')
  end

  describe "with two items" do
    before do
      item1 = Item.create!( :text => "one item")
      item2 = Item.create!( :text => "another item")
    end
    it "shows all items" do
      visit items_path
      page.must_have_content("one item")
      page.must_have_content("another item")
      page.wont_have_content("item not in database")
    end
  end

  describe "with one item" do
    before do
      item1 = Item.create!( :text => "the one item")
    end
    it "has link to item page" do
      visit items_path
      within(:xpath,"//tbody/tr[3]") do
        #save_and_open_page
        click_on('Show')
      end
      page.must_have_content('the one item')
    end
  end
end

