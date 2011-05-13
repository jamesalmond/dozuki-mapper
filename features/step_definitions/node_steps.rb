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
    def self.from_node(node)
      new.tap do |dimensions|
        dimensions.map_from(node) do |mapper|
          mapper.int :width
          mapper.int :depth
        end
      end
    end
  end
end

When /^I map the plot node to a plot object with:$/ do |string|
  @plot = Plot.new
  @doc = Dozuki::XML.parse(@xml)
  @plot.map_from(@doc.get('/plot')) do |map|
    eval(string)
  end
end

Then /^the plot should have a name of "([^"]*)"$/ do |name|
  @plot.name.should == name
end

Then /^the plot should have dimensions with a width of (\d+) and a depth of (\d+)$/ do |width, depth|
  dimensions = @plot.dimensions
  dimensions.width.should == width.to_i
  dimensions.depth.should == depth.to_i
end

