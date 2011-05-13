Feature: mapping a document with float elements to an object
  So that I don't have to spend all my time typing in repetitive XPaths
  As an API consumer
  I want to map a document to an object


  Scenario: I have a simple mapping
    Given I have an item with max_price, min_price and average_price
    And I have the XML:
      """
      <item>
        <max_price>20.43</max_price>
        <min_price>9.50</min_price>
        <average_price>99</average_price>
      </item>
      """
    When I map the item node to an item object with:
      """
        map.float :max_price
        map.float :min_price
        map.float :average_price
      """
    Then the event should have a max_price of 20.43
    And the event should have a min_price of 9.50
    And the event should have a average_price of 99.0
