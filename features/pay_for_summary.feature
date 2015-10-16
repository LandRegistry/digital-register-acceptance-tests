@US122
Feature: Pay for summary of register

As a user
I want to pay for the summary info using a [debit/credit] card
So that I can pay as quickly as possible

Acceptance Criteria:
secure environment for provision of payment details
·        user logged in;
·        user has selected product;
·        user has been informed of fee payable;
·        user has confirmed that they wish to purchase;
·        user has confirmed that they wish to have payment authorised


Background:
  Given I am an initial private beta user
  And I have logged in
  When I attempt to view the Summary of the Register for a title

  Scenario: View Summary authorisation for payment
    And I have payment authorisation
    Then the title summary page is displayed

  Scenario: View for summary no authorisation for payment
    And I have no payment authorisation
    Then I can not view the summary
    And a message is displayed
