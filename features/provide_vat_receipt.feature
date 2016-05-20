@US259
Feature: Add VAT receipt at the bottom of the printed summary page
As a business customer
I want to retain a VAT receipt for all of my purchases
So that I can claim back my VAT

Acceptance criteria:

1) Must contain:
    - Unique invoice number that follows on from the last invoice
    - LR business name and address
    - LR VAT number
    - The tax point (or ‘time of supply’) if this is different from the invoice date [see activity point below for more info on this point]
    - Description of the goods or services
    - Rate of VAT charged per item - if an item is exempt or zero-rated make clear no VAT on these items
    - Total amount including VAT
2) Date shown in VAT receipt is date summary page is viewed
3) 'Description of the goods or services' should be the same as the service type we send to WorldPay
4) Invoice number should be static
5) Must be able to be printed

Background:
  Given I have a freehold title
  And I search for the property using the postcode
  When I choose to buy a title Summary

  Scenario: Pay for and View VAT receipt on Summary
    Then I can view the title VAT receipt on the Summary
    And it has the correct information

  Scenario: Pay for and print VAT receipt
    And I can print the title summary page
    And the VAT receipt is on the printed result

  Scenario: View VAT receipt after switching to Welsh and back to English again
    When I have selected the Welsh translation
    Then I can view the title VAT receipt on the Summary in Welsh
    And it has the correct information in welsh
    When I select the English translation
    Then I can view the title VAT receipt on the Summary
    And it has the correct information
