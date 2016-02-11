@US312
Feature: Map on property confirmation page
As a customer
I want to see a map on the individual property results page (the page that identifies a single title)
So that I can determine whether I have identified the property that I'm interested in before I pay

Acceptance criteria:
Map is displayed on the 'Order Title Summary' page
Map is not displayed as part of the Summary

Background:
     Given I have a title with a private individual owner
     And I search for the property using the postcode


Scenario: Map displayed on Order Title Summary page
Then I am on the order the title summary page
And I can see the map of the property extent displayed

Scenario: Map is not displayed on Summary page
When I view the title summary page
Then I do not see the map displayed
