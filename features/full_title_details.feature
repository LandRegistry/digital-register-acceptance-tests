@US065
Feature: Generate full register content

  Background:
    Given I am an initial private beta user
    And I have logged in
    When I navigate to a register title page


  Scenario: Full text of register is displayed
    Then I can see the full text of the register

  Scenario: Date of register entry is displayed when available
    Then I can see the date of the register entry

  Scenario: Date of register entry default text is displayed when not available
    Then I can see the standard text against the register entry

  Scenario: Sub-register and entry number of each entry is displayed
    Then I can see the entry number of each entry
    