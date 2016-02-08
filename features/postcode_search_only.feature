@US314
Feature: Only postcode search available
As a customer
I want to understand what search facilities are available
So that I don't waste my time using inappropriate searches

Scenario: only postcode search available
    Given I am on the title search page
    Then I am informed that I have to search using the postcode
