@US070
Feature: View Tenure In Title Summary

Scenario: display tenure information
  Given I am an initial private beta user
  And I have logged in
  And I have a title with a tenure of Freehold
  When I view the title summary page
  Then I see the tenure information
