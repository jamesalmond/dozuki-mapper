Feature: mapping a node to to another object
  So that I don't have to spend all my time typing in repetitive XPaths
  As an API consumer
  I want to map a node to another object


  Scenario: I have a simple mapping
    Given I have plot with name and dimensions
    And I have a dimensions class with width, depth and a from_node class method
    And I have the XML:
      """
      <plot>
        <name>Tiny Plot</name>
        <dimensions>
          <width>100</width>
          <depth>200</depth>
        </dimensions>
      </plot>
      """
    When I map the plot node to a plot object with:
      """
        map.string :name
        map.node :dimensions, :as => Dimensions
      """
    Then the plot should have a name of "Tiny Plot"
    And the plot should have dimensions with a width of 100 and a depth of 200
