Feature: mapping a document with date elements to an object
  So that I don't have to spend all my time typing in repetitive XPaths
  As an API consumer
  I want to map a document to an object


  Scenario: I have a simple mapping
    Given I have an event with start_date, end_date and sold_out
    And I have the XML:
      """
      <event>
        <start_date>2011-02-01</start_date>
        <end_date>2011-05-13</end_date>
        <sold_out>2010-12-25</sold_out>
      </event>
      """
    When I map the event node to an event object with:
      """
        map.date :start_date
        map.date :end_date
        map.date :sold_out
      """
    Then the event should have a start_date of 01/2/2011
    And the event should have a end_date of 13/5/2011
    And the event should have a sold_out of 25/12/2010
