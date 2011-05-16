Given /^I have an event with start_date, end_date and sold_out$/ do
  class Event
    include Dozuki::Mapper
    attr_accessor :start_date, :end_date, :sold_out
  end
end

When /^I map the event node to an event object with:$/ do |string|
  Event.instance_eval %Q{
    map_with do |map|
      #{string}
    end
  }
  @event = Event.from_node(@doc.get('/event'))
end

Then /^the event should have a (.*) of (\d+)\/(\d+)\/(\d+)$/ do |field, day, month, year|
  @event.send(field).should == Date.civil(year.to_i, month.to_i, day.to_i)
end

