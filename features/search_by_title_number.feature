@US049
Feature: Search By Title Number for Title Register

Scenario: Search for Title Register via Title Number
  Given I am an initial private beta user
  And I have logged in
  And I have a title
  And I search for a property using the Title Number
  When I view the register details page
  Then I can view the register details for the selected title
