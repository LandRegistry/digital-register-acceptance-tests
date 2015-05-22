@US045
Feature: Include private individual owners

  Acceptance criteria
    Also titles with private individual owners must be available for selection
    Private individual owner details must be displayed on the Digital Register
    If the information relating to the owner of the title is not available
    then a meaningful message must be displayed

  Background:
    Given I am an initial private beta user
    And the digital register is setup to also show private individual owners
    And I have logged in

  Scenario: View Private Individual
    And I have a title with a private individual owner
    When I view the register details page
    Then I can view the register details for the selected title

  Scenario: View Charity Private Individual
    And I have a title with a charity with trustees that are private individuals
    When I view the register details page
    Then I can view the register details for the selected title

  Scenario: View owners Private and Non Private Individuals
    And I have a title with private and non private Individual owners
    When I view the register details page
    Then I can view the register details for the selected title
