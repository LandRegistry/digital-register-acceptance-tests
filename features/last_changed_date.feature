@US027
Feature: Application last changed date displayed in title summary

Acceptance Criteria:
  - The date the application was last changed must be displayed in the title summary

  Scenario: Last changed date
    Given I am an initial private beta user
    And I have logged in
    And I have a title
    When I view the register details page
    Then I see the date at which the title was last changed
