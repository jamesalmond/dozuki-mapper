Feature: mapping a node's children to to another object
  So that I don't have to spend all my time typing in repetitive XPaths
  As an API consumer
  I want to map a node to a series of other objects

  Scenario: I have a simple mapping
    Given I have car with brand and colours
    And I have a colour class with description and hex and a from_node method
    And I have the XML:
      """
      <car>
        <brand>Fawd</brand>
        <colour>
          <description>Red</description>
          <hex>#FF0000</hex>
        </colour>
        <colour>
          <description>Blue</description>
          <hex>#0000FF</hex>
        </colour>
      </car>
      """
    When I map the car node to a car object with:
      """
        map.string :brand
        map.each :colour, :as => Colour, :to => :colours
      """
    Then the car should have a brand of "Fawd"
    And the car should have a colour with a description of "Red" and a hex of "#FF0000"
    And the car should have a colour with a description of "Blue" and a hex of "#0000FF"
