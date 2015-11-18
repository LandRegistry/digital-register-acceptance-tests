@US211
Feature: show district on PDF

As a customer
I want to see the district on the PDF
So that I know where the property is if the property description doesn't include this information

Acceptance Criteria
  Should be displayed at the top of the Property Register, under the explanatory note.
  ALWAYS display the district (if available) no need to test if the property description contains it.

Scenario: show district on pdf
  Given I have a title with the district "City of Plymouth"
  When I view the Official Copy PDF
  Then I can see that the district is displayed
