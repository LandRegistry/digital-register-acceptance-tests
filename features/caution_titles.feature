@B47
Feature: Caution titles

Background:
  Given I am an initial private beta user
  And I have logged in

  Scenario: Caution titles are not displayed
    Given I have a caution title
    When I view the title summary page
    Then I get a page not found message
