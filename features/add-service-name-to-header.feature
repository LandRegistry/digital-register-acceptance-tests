@US355
Feature: Add service name to header

The main site header should say "Find property information".

Acceptance Criteria: All headers say "Find property information"

Scenario: Add service name to header
    Given I have a freehold title
    When I view the title summary page
    Then I can see that 'Find property information' is shown in the header
