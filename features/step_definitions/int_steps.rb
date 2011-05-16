Given /^I have a shop with items, staff and suppliers$/ do
  class Shop
    include Dozuki::Mapper
    attr_accessor :staff, :items, :suppliers
  end
end

Then /^the shop should have (\d+) (.*)$/ do |count, field|
  @shop.send(field).should == count.to_i
end

When /^I map the shop node to a shop object with:$/ do |string|
  Shop.instance_eval %Q{
    map_with do |map|
      #{string}
    end
  }
  @shop = Shop.from_node(@doc.get('/shop'))
end

