@US294
Feature: Confirm order and summary pages contain information that is only relevant at time it is displayed

As a customer
I want to know that the information displayed in the Summary is only relevant at the time that it is displayed
So that I do not mis-interpret the data

Add to the confirm your order and summary pages only (screenshot examples attached below).

Wording to add - "This information can change if we receive an application. This service is unable to tell you whether or not there is an application pending with the Land Registry."

Scenario: Information displayed on Order Confirmation page
  Given I have a freehold title
  And I search for the property using the postcode
  When I am on the order confirmation page
  Then I am informed that the information is only relevant at the time it is displayed

  Scenario: Information displayed on Summary page
  Given I have a title
  And I search for a property using the Title Number
  When I view the title summary page
  Then I am informed that the information is only relevant at the time it is displayed
