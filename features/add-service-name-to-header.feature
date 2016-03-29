@US355
Feature: Add service name to header

The main site header should say "Search for property information".

Acceptance Criteria: All headers say "Search for property information"

Scenario: Add service name to header
    Given I have a freehold title
    When I view the title summary page
    Then I can see that "Search for property information" is shown in the header
    When I click on the link
    Then I am returned to the landing page
