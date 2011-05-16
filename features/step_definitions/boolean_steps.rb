Given /^I have a bar with open, busy and dodgy$/ do
  class Bar
    include Dozuki::Mapper
    attr_accessor :open, :busy, :dodgy
  end
end

When /^I map the bar node to a bar object with:$/ do |string|
  Bar.instance_eval %Q{
    map_with do |map|
      #{string}
    end
  }
  @bar = Bar.from_node(@doc.get('/bar'))
end

Then /^the bar should be (.*)$/ do |field|
  @bar.send(field).should == true
end

Then /^the bar should not be (.*)$/ do |field|
  @bar.send(field).should == false
end

