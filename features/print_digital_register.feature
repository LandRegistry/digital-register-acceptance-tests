@US133
Feature: Print Digital register page

Background:
	Given I am an initial private beta user
	And I have logged in

Scenario: Print Digital register page
   When I navigate to a register title page
   Then the print option is available
   And I can print the page
