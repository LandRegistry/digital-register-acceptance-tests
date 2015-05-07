@US070
Feature: View Tenure In Summary Box

Background:
	Given I am an initial private beta user
	And I have logged in

Scenario: display tenure information
  And I have a title with a tenure of Freehold
  When I view the register details page
  Then I see the tenure information in the summary box

Scenario: no tenure information information to display
  And I have a title with no tenure type
  When I view the register details page
  Then I see a no tenure message in the summary box
