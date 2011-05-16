Given /^I have plot with name and dimensions$/ do
  class Plot
    include Dozuki::Mapper
    attr_accessor :name, :dimensions
  end
end

Given /^I have a dimensions class with width, depth and a from_node class method$/ do
  class Dimensions
    include Dozuki::Mapper
    attr_accessor :width, :depth
    map_with do |map|
      map.int :width
      map.int :depth
    end
  end
end

When /^I map the plot node to a plot object with:$/ do |string|
  Plot.instance_eval %Q{
    map_with do |map|
      #{string}
    end
  }
  @plot = Plot.from_node(@doc.get('/plot'))
end

Then /^the plot should have a name of "([^"]*)"$/ do |name|
  @plot.name.should == name
end

Then /^the plot should have dimensions with a width of (\d+) and a depth of (\d+)$/ do |width, depth|
  dimensions = @plot.dimensions
  dimensions.width.should == width.to_i
  dimensions.depth.should == depth.to_i
end

