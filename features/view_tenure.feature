@US070
Feature: View Tenure In Summary Box

Scenario: display tenure information
  Given I am an initial private beta user
  And I have logged in
  And I have a title with a tenure of Freehold
  When I view the title summary page
  Then I see the tenure information in the summary box
