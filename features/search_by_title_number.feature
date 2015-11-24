@US049
Feature: Search By Title Number for Title Register

Scenario: Search for Title Register via Title Number
  Given I have a title
  And I search for a property using the Title Number
  When I view the title summary page
  Then I can view the register details for the selected title
