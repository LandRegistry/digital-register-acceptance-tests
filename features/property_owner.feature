@US024
Feature: Property Owner is displayed on the summary page

Background:
  Given I am an initial private beta user
  And I have logged in

Scenario: find a single property owner
  Given I have a title with an owner
  When I view the title summary page
  Then I can see who owns the selected title

Scenario: find multiple property owners
  Given I have a title with multiple owners
  When I view the title summary page
  Then I can see all the owners for the selected title