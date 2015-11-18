@US027
Feature: Application last changed date displayed in title summary

Acceptance Criteria:
  - The date the application was last changed must be displayed in the title summary

  Scenario: Last changed date
    Given I have a title
    When I view the title summary page
    Then I see the date at which the title was last changed
