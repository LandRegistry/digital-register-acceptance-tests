@US16
Feature: Search by Address

As a user
I want to be able to search by using either part of or the whole property address
So that I can find the property I am interested in

Acceptance criteria:
   - Search by full address
   - maximum number of results

Background:
	Given I am an initial private beta user
	And I have logged in

  Scenario: Search by whole of property address
    Given I have an address with a single Title Number
    When I search for a property using the whole address
    Then I will be displayed a list of results
    And they will include the address that has been searched for

  Scenario: Search by part of property address
    Given I have 51 addresses in the same City
    When I search for a property using only the City part of an address
    Then I can see a maximum of 50 addresses included in the search result

  Scenario: No search term entered
    Given I have an address with a single Title Number
    When I search for a property using no search term
    Then an unavailable message is displayed
