@US122
Feature: Pay for summary of register

As a user
I want to pay for the summary info using a [debit/credit] card
So that I can pay as quickly as possible

Acceptance Criteria:
Secure environment for provision of payment details
 - user logged in
 - user has selected product
 - user has been informed of fee payable
 - user has confirmed that they wish to purchase
 - user has accepted terms and conditions to the purchase
 - user has confirmed that they wish to have payment authorised

Background:
    Given I have searched and found a Title that I want to buy

@wip
  Scenario: View Summary authorisation for payment
    When I have payment authorisation
    Then the title summary page is displayed

@wip
  Scenario: View for summary no authorisation for payment
    When I have no payment authorisation
    Then I can not view the summary

  Scenario: Cannot go through with payment if terms and conditions have not been checked
    Given I have not checked the terms and conditions box
    When I have selected to pay for the summary
    Then I am prevented from going any further
    And an error message is displayed
