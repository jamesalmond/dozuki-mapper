Feature: mapping a document with int elements to an object
  So that I don't have to spend all my time typing in repetitive XPaths
  As an API consumer
  I want to map a document to an object


  Scenario: I have a simple mapping
    Given I have a shop with items, staff and suppliers
    And I have the XML:
      """
      <shop>
        <items>300</items>
        <staff>1</staff>
        <suppliers>43</suppliers>
      </shop>
      """
    When I map the shop node to a shop object with:
      """
        map.int :items
        map.int :staff
        map.int :suppliers
      """
    Then the shop should have 1 staff
    And the shop should have 300 items
    And the shop should have 43 suppliers
