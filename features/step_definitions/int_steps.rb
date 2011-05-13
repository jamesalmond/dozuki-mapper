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
  @shop = Shop.new
  @doc = Dozuki::XML.parse(@xml)
  @shop.map_from(@doc.get('/shop')) do |map|
    eval(string)
  end
end

