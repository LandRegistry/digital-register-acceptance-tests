@US025
Feature: View Owner And Contact Information

Acceptance criteria
  All owners and their contact details must be displayed
  Must be displayed in the order they are displayed on the register: if possible (look at a title, check if the order in the JSON corresponds to the register order)

  Scenario:  one owner multiple addresses
    Given I have a title with one owner that has property, foreign and BFPO addresses
    When I view the title summary page
    Then I can see the owner for the selected title
    And I can see all the owners addresses in the order they are displayed on the register

  Scenario: find multiple property owner addresses
    Given I have a title with 3 owners
    And the owners have BFPO and foreign addresses
    When I view the title summary page
    Then I can see all the owners for the selected title
    And I can see all the owners addresses in the order they are displayed on the register
