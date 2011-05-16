Feature: mapping a document with boolean elements to an object
  So that I don't have to spend all my time typing in repetitive XPaths
  As an API consumer
  I want to map boolean fields to an object

  @boolean
  Scenario: I have a simple mapping
    Given I have a bar with open, busy and dodgy
    And I have the XML:
      """
      <bar>
        <open>true</open>
        <busy>1</busy>
        <dodgy>0</dodgy>
      </bar>
      """
    When I map the bar node to a bar object with:
      """
        map.boolean :open
        map.boolean :busy
        map.boolean :dodgy
      """
    Then the bar should be open
    And the bar should be busy
    And the bar should not be dodgy
