Given /^I have an person with name, address and post_code$/ do
  class Person
    include Dozuki::Mapper
    attr_accessor :name, :address, :post_code
  end
end

Given /^I have the XML:$/ do |string|
  @doc = Dozuki::XML.parse(string)
end

When /^I map the person node to a person object with:$/ do |string|
  Person.instance_eval %Q{
    map_with do |map|
     #{string}
    end
  }
  @person = Person.from_node(@doc.get('/person'))
end

Then /^the person should have the (.*) "([^"]*)"$/ do |field, string|
  @person.send(field).should == string
end
