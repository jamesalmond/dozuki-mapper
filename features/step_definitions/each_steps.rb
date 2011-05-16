Given /^I have car with brand and colours$/ do
  class Car
    include Dozuki::Mapper
    attr_accessor :brand, :colours
    def initialize
      self.colours = []
    end
  end
end

Given /^I have a colour class with description and hex and a from_node method$/ do
  class Colour
    include Dozuki::Mapper
    attr_accessor :description, :hex
    map_with do |map|
      map.string :description
      map.string :hex
    end
  end
end

When /^I map the car node to a car object with:$/ do |string|
  Car.instance_eval %Q{
    map_with do |map|
      #{string}
    end
  }
  @car = Car.from_node(@doc.get('/car'))
end

Then /^the car should have a brand of "([^"]*)"$/ do |brand|
  @car.brand.should == brand
end

Then /^the car should have a colour with a description of "([^"]*)" and a hex of "([^"]*)"$/ do |description, hex|
  @car.colours.any?{|car| car.description == description && car.hex == hex}.should be_true
end

