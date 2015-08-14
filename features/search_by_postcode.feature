@US021
Feature: Search for title by address

Acceptance Criteria:
  - Search only by postcode
  - If more than one title number is associated with the property
    display all of them so they are associated to that address.

Background:
  Given I am an initial private beta user
  And I have logged in

Scenario: Search for single title by postcode
  Given I have an address with a single Title Number
  And I search for the property using the postcode
  Then the address and related title number is displayed
  And I can then view the title register

Scenario: Search for multiple titles by postcode
  Given I have an address with multiple Title Numbers
  And I search for the property using the postcode
  Then the address and related title numbers are displayed
  And I can view one of the title registers

Scenario: Search Single Title By Postcode with no spaces
  Given I have an address with a single Title Number
  And I search for a property entering a postcode with no spaces
  Then the address and related title number is displayed
  And I can then view the title register
