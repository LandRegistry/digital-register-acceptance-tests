@US085
Feature: Private Beta Log out

Background:
	Given I am an initial private beta user
	And I have logged in

Scenario: Log out option on all screens
  Given I am on the search screen
  Then the Log out option is available
  When I navigate to a register title page
  Then the Log out option is available
  And I am able to Log out

Scenario: Return to login screen on log out
  When I Log out
	Then I am redirected to the login page

Scenario: Log out option not available if not logged in
  When I Log out
	Then I am redirected to the login page
  And the Log out option is not available

Scenario: Unable to search for a title when logged out
  When I Log out
  And I try to navigate to a title register
	Then I am redirected to the login page
