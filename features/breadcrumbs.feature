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

Scenario: Return to results screen
  And I navigate to a register title page
  When I select the search results breadcrumb
  Then I am returned to the search results screen and position I was viewing before

Scenario: Return to Find a title screen
  And I navigate to a register title page
  When I select the find a title breadcrumb
  Then I am returned to the initial search screen
