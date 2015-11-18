@US036
Feature: View Most Recent Price Paid/Stated Information

  As a citizen
  I want to see
    1. the most recent price paid or price stated,
    2. the date the price was paid or stated
  So that I know what price that was paid for the property or the value of the property stated and the date that relates to the information

  Acceptance Criteria
    1. If present, must display the most *recent price* paid from the system of record or price stated
    2. If no price information is found, no need to display the label and "not available"

  Scenario: Display most recent price paid information
    Given I have a title with one price paid or stated entry
    When I view the title summary page
    Then I can see the price paid or stated

  Scenario: No price paid information to display
    Given I have a title with no price paid or stated information
    When I view the title summary page
    Then I don't see 'not available' in the price paid or stated part of the page
