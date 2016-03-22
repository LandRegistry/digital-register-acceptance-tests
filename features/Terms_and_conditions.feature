@US347
Feature: Create a terms and conditions page

As a customer
I want to be able to read the terms and conditions before I agree to be bound by them
So that I understand what I am agreeing to
Note: This US relates to preparing the page that the T & C's will actually sit on
Acceptance Criteria:
I can read the T&Cs and then carry on with the purchase

 Scenario: Terms and conditions exist
    Given I am viewing the search results page
    Then I will be displayed the terms and conditions link in the footer
    When I click the link to view them
    Then I am taken to the terms and conditions page

 Scenario: View terms and conditions
    Given I am on the terms and conditions page
    Then I am provided information on the terms and conditions

 Scenario: User can return from Terms and conditions to page they were on
    Given I go to the terms and conditions page
    When I click the back button
    Then I am returned to the page I was originally on
