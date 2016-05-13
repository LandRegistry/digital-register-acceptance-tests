@backlinks

Feature: Navigate around the service using back links

Scenario: User can return from Terms and conditions to page they were on
    Given I view the property search page
    And I observe the page I am currently on
    When I go to the terms and conditions page
    And I click the back link labelled "Back"
    Then I am returned to the page I was originally on

Scenario: User can return from confirm order to the search results page
    Given I have 11 addresses in the same City
    When I search for a property using only the City part of an address
    And I can go to the next page (page 2)
    And I observe the page I am currently on
    When I select a title
    And I click the back link labelled "Back to search results"
    Then I am returned to the page I was originally on
