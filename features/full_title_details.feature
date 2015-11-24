@US065
@full-register-content-on
Feature: Generate full register content

  # TODO: create tests for the full register content flag being off

  Background:
    Given I navigate to a register title page pdf

  Scenario: Full text of register is displayed
    Then I can see the full text of the register

  Scenario: Date of register entry is displayed when available
    Then I can see the date of the register entry

  Scenario: Sub-register and entry number of each entry is displayed
    Then I can see the entry number of each entry
