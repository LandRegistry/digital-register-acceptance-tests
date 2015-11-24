@US90
Feature: Update of Title Information

Background:
  Given I have a title

Scenario: User views updated title information
  And the title information is updated
  When I search for a property using the Title Number
  Then I am able to view the updated information
