Given /^I have an person with name, address and post_code$/ do
  class Person
    include Dozuki::Mapper
    attr_accessor :name, :address, :person
  end
end

Given /^I have the XML:$/ do |string|
  @xml = string
end

When /^I map the person node to a person object with:$/ do |string|
  @person = Person.new
  @doc = Dozuki::XML.parse(@xml)
  @person.map_from(@doc.get('/person')) do |map|
    eval(string)
  end
end

Then /^the person should have the (.*) "([^"]*)"$/ do |field, string|
  @person.send(field).should == string
end
