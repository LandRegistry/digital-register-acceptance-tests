@US135
Feature: add breadcrumbs to get to previous Digital Register screens

Acceptance Criteria
1 Behaviour should be the same as browser back button
2 Use breadcrumbs.
3 Title page breadcrumb element should be the title number you're displaying
4. "Search result" breadcrumb element should return to the results page

  Scenario: Return to list of results screen
    Given I have 51 addresses in the same City
    When I search for a property using only the City part of an address
    And I navigate to the next page of the results and view the first title
    And I select the search results breadcrumb
    Then I am returned to page 2 of the search results

  Scenario: Remain on summary of Title screen
    Given I navigate directly to a register title page
    Then there is no search results breadcrumb

  Scenario: Return to initial search screen
    Given I navigate directly to a register title page
    When I select the initial search breadcrumb
    Then I am returned to the initial search screen
