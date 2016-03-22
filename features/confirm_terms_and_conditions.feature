@US305
Feature: Confirmation of reading terms and conditions before purchasing

As a Service Provider
I want the customer to positively acknowledge that they have read the terms and conditions relating to use of the service ahead of using it
So that we are legally protected against claims of the product being mis sold

This US relates to adding a 'tick box' with associated text before the user makes a purchase

This would sit on the 'Sign- in' page

Acceptance Criteria:
The user cannot purchase a summary until that have acknowledged that they have read the T & C's

Scenario: Confirmation Terms and conditions have been read
    Given I have a freehold title
    And I search for the property using the postcode
    When I am on the order confirmation page
    Then I will be displayed the terms and conditions link in the check box
    When I click the link to view them
    Then I am taken to the terms and conditions page
