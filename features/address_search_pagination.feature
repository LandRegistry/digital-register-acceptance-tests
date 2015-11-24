@US105
Feature: Address Search Pagination

Acceptance criteria
  20 results per page

  Scenario: Address search pagination
    Given I have 45 addresses in the same City
    When I search for a property using only the City part of an address
    Then I can see 20 addresses per page
    And I see the number of pages is 3
    And I can go to the next page (page 2)

  Scenario: No address search pagination
    Given I have 10 addresses in the same City
    When I search for a property using only the City part of an address
    Then I cannot see pagination details
