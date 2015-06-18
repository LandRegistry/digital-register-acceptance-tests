@US135
Feature: add breadcrumbs to get to previous Digital Register screens

Acceptance Criteria
1 Behaviour should be the same as browser back button
2 Use breadcrumbs.
3 Title page breadcrumb element should be the title number you're displaying
4. "Search result" breadcrumb element should return to the results page

Background:
  Given I am an initial private beta user
  And I have logged in

  Scenario: Return to list of results screen
    And I have 51 addresses in the same City
    When I search for a property using only the City part of an address
    And I view an address on page 2 of the results
    And I select the search results breadcrumb
    Then I am returned to the search results screen and position I was viewing before

  Scenario: Remain on summary of Title screen
    And I navigate directly to a register title page
    Then there is no search results breadcrumb
    
  Scenario: Return to Find a title screen
    And I navigate directly to a register title page
    When I select the find a title breadcrumb
    Then I am returned to the initial search screen

  Scenario: Return to results screen
    And I navigate to a register title page
    When I select the search results breadcrumb
    Then I am returned to the search results screen and position I was viewing before
