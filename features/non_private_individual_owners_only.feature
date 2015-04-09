@US044
Feature: View Non Private Individuals Only

Background:
  Given I am an initial private beta user
  And I have logged in

  Scenario: Titles with Non Private Individual are displayed
    Given I have a title with a non private individual owner
    When I view the register details page
    Then I can view the register details for the selected title

  Scenario:  Titles with Charity Private Individual are not displayed
    Given I have a title with a charity with trustees that are private individuals
    When I view the register details page
    Then I get a page not found message

  Scenario: Titles with Charity Non Private Individual are not displayed
    Given I have a title with a charity with trustees that are non private individual owners
    When I view the register details page
    Then I can view the register details for the selected title

  Scenario: Titles with Private Individuals are displayed
    Give I have a title with a private individual owner
    When I view the register details page
    Then I get a page not found message
