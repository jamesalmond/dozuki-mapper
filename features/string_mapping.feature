Feature: mapping a document with string elements to an object
  So that I don't have to spend all my time typing in repetitive XPaths
  As an API consumer
  I want to map a document to an object

  Scenario: I have a simple mapping
    Given I have an person with name, address and post_code
    And I have the XML:
      """
      <person>
        <name>John Smith</name>
        <address>1 Main Street</address>
        <post_code>NW1 3ED</post_code>
      </person>
      """
    When I map the person node to a person object with:
      """
        map.string :name
        map.string :address
        map.string :post_code
      """
    Then the person should have the name "John Smith"
    Then the person should have the address "1 Main Street"
    Then the person should have the post_code "NW1 3ED"
