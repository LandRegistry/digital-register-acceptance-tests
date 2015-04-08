@US90
Feature: Update of Title Information

Background:
	Given I am an initial private beta user
	And I have logged in
	And I have a title

Scenario: User views updated title information
  Given the title information is updated
  When I search for a property using the Title Number
  Then I am able to view the updated information
