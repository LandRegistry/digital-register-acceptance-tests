@US312
Feature: Map on property confirmation page
As a customer
I want to see a map on the individual property results page (the page that identifies a single title)
So that I can determine whether I have identified the property that I'm interested in before I pay

Acceptance criteria:
Order confirmation page is created
Map is displayed on the 'Order Title Summary' page
Map is not displayed as part of the Summary

Scenario: Freehold Order confirmation page
    Given I have a freehold title
    And I search for the property using the postcode
    When I am on the order confirmation page
    Then I can see an explanation of the freehold tenure
    And I can see the property indicated on the map

Scenario: Leasehold Order confirmation page
    Given I have a leasehold title
    And I search for the property using the postcode
    When I am on the order confirmation page
    Then I can see an explanation of the leasehold tenure
    And I can see the property indicated on the map

Scenario: Caution title Order confirmation page
    Given I have a caution title
    And I search for the property using the postcode
    When I am on the order confirmation page
    And I expand the caution against first registration details
    Then I see an explanation of what caution title means
    And I can see the property indicated on the map
