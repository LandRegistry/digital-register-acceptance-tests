@US211
Feature: show district on PDF

As a customer
I want to see the district on the PDF
So that I know where the property is if the property description doesn't include this information

Acceptance Criteria
  Should be displayed at the top of the Property Register, under the explanatory note.
  ALWAYS display the district (if available) no need to test if the property description contains it.

Scenario: show district on pdf
  Given I am an initial private beta user
  And I have logged in
  When I attempt to view the Official Copy of the Register for a title
  And the PDF is displayed
  Then I can see that the district is displayed
