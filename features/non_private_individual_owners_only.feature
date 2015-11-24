@US044
@private-indiv-off
Feature: View Non Private Individuals Only

This set of tests should be excluded from execution (... --tags ~@private-indiv-off) when
the system is expected to offer private individual data to users.

  Scenario: Titles with Non Private Individual are displayed
    Given I have a title with a non private individual owner
    When I view the title summary page
    Then I can view the register details for the selected title

  Scenario:  Titles with Charity Private Individual are not displayed
    Given I have a title with a charity with trustees that are private individuals
    When I view the title summary page
    Then I get a page not found message

  Scenario: Titles with Charity Non Private Individual are displayed
    Given I have a title with a charity with trustees that are non private individual owners
    When I view the title summary page
    Then I can view the register details for the selected title

  Scenario: Titles with Private Individuals are not displayed
    Given I have a title with a private individual owner
    When I view the title summary page
    Then I get a page not found message
