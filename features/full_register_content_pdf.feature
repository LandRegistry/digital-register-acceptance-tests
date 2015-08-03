@US177
Feature: Full register content pdf

Acceptance criteria
  - Must be behind a feature flag
  - Initial design follow version 8 styling - to be covered by manual testing

Background:
  Given I am an initial private beta user
  And I have logged in

  Scenario: PDF is accessible when feature flag is turned on
    Given the feature flag for full register content PDF is turned on
    And that I attempt to view the PDF for a title
    Then the PDF is displayed

  Scenario: PDF is not accessible via button on title register page when feature flag is turned off
    Given the feature flag for full register content PDF is turned off
    And I visit the title register summary page
    Then the PDF Download button is not displayed

    Scenario: PDF is accessible via button on title register page when feature flag is turned on
      Given the feature flag for full register content PDF is turned on
      And I visit the title register summary page
      Then the PDF Download button is displayed

  Scenario: Content of register is displayed on pdf
    Given the feature flag for full register content PDF is turned on
    And that I attempt to view the PDF for a title
    Then that titles full register is displayed on the PDF
