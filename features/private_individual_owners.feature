@US045
@private-indiv-on
Feature: Include private individual owners

This set of tests should be excluded from execution (... --tags ~@private-indiv-on) when
the system is expected not to offer private individual data to users.

Acceptance criteria
  Also titles with private individual owners must be available for selection
  Private individual owner details must be displayed on the Digital Register
  If the information relating to the owner of the title is not available
  then a meaningful message must be displayed

  Scenario: View Private Individual
    Given I have a title with a private individual owner
    When I view the title summary page
    Then I can view the register details for the selected title

  Scenario: View Charity Private Individual
    Given I have a title with a charity with trustees that are private individuals
    When I view the title summary page
    Then I can view the register details for the selected title

  Scenario: View owners Private and Non Private Individuals
    Given I have a title with private and non private Individual owners
    When I view the title summary page
    Then I can view the register details for the selected title
