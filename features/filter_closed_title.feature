@US69
Feature: Digital Register will not contain Closed Titles

Background:
	Given I am an initial private beta user
	And I have logged in

Scenario: Open Title is displayed in Digital Register
	Given I have an open title
	When I search for a property using the Title Number
	Then the title summary page is displayed

Scenario: Closed Title is not displayed in Digital Register
	Given I have a closed title
	When I search for a property using the Title Number
	Then an unavailable message is displayed

Scenario: Open Title updated to Close will not be displayed in Digital Register
	Given I have a recently closed title
	When I search for a property using the Title Number
	Then an unavailable message is displayed
