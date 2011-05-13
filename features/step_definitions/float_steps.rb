Given /^I have an item with max_price, min_price and average_price$/ do
  class Item
    include Dozuki::Mapper
    attr_accessor :max_price, :min_price, :average_price
  end
end

When /^I map the item node to an item object with:$/ do |string|
  @item = Item.new
  @doc = Dozuki::XML.parse(@xml)
  @item.map_from(@doc.get('/item')) do |map|
    eval(string)
  end
end

Then /^the event should have a (.*) of (\d+\.\d+)$/ do |field, float|
  @item.send(field).should == float.to_f
end
