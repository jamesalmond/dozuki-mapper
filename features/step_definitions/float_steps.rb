Given /^I have an item with max_price, min_price and average_price$/ do
  class Item
    include Dozuki::Mapper
    attr_accessor :max_price, :min_price, :average_price
  end
end

When /^I map the item node to an item object with:$/ do |string|
  Item.instance_eval %Q{
    map_with do |map|
     #{string}
    end
  }
  @item = Item.from_node(@doc.get('/item'))
end

Then /^the event should have a (.*) of (\d+\.\d+)$/ do |field, float|
  @item.send(field).should == float.to_f
end
