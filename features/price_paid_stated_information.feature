@US036
Feature: View Most Recent Price Paid/Stated Information

  As a citizen
  I want to see
    1. the most recent price paid or price stated,
    2. the date the price was paid or stated
  So that I know what price that was paid for the property or the value of the property stated and the date that relates to the information

  Acceptance Criteria
    1. If present, must display the most *recent price* paid from the system of record or price stated
    2. If present, must display the *date* the most recent price was paid or price stated
    3. If no price information is found, no need to display the label and "not available"
    4. If it is free text display 'see below' will be displayed and the price paid/stated will be displayed in the main part of the register

  Background:
    Given I am an initial private beta user
    And I have logged in

  Scenario: Display most recent price paid information (structured)
    Given I have a title with one price paid/stated entry
    When I view the register details page
    Then I can see the price paid/stated and date in the summary
    And I can see the text description of price paid/stated information in the main part of the register

  Scenario: Display most recent price paid information (free text only)
    Given I have a title with one free text price paid/stated entry
    When I view the register details page
    Then I can see 'see below' in the price paid/stated part of the summary
    And I can see the text description of price paid/stated information in the main part of the register

  Scenario: No price paid information to display
    Given I have a title with no price paid/stated information
    When I view the register details page
    Then I don't see 'not available' in the price paid/stated part of the summary
