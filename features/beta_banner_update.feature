@US351
Feature: update beta banner

As a Service Provider
I want to ensure that the word 'private' is removed from the banner at the top of the pages in the service
So that the customer is not provided with incorrect information
Align banner with prototype wording
Remove word 'Private'

  Scenario: 'Private' removed from beta banner on search page
   Given I am on the property search page
   Then I can see the Beta banner is displayed with the correct wording

  Scenario: 'Private' removed from beta banner on search results page
   Given I am viewing the search results page
   Then I can see the Beta banner is displayed with the correct wording

  Scenario: 'Private' removed from beta banner on order confirmation page
   Given I have a freehold title
   And I search for the property using the postcode
   When I am on the order confirmation page
   Then I can see the Beta banner is displayed with the correct wording

  Scenario: 'Private' removed from beta banner on summary page
   Given I have a title
   And I search for a property using the Title Number
   When I view the title summary page
   Then I can see the Beta banner is displayed with the correct wording
