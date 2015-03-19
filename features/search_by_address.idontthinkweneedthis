@US021
Feature: Search By Address

Scenario: Search Single Title By Postcode
Given I am a citizen
And I have an address with a single Title Number
And I have logged in
And I search for a property using minimum search criteria
When I view the register details page
Then only the information for the selected Title Number will be displayed


Scenario: Search Multiple Titles By Postcode
Given I am a citizen
And I have an address with multiple Title Numbers
And I have logged in
And I search for a property using minimum search criteria
When I view the register details page
Then I can select the Title Number I am interested in
And I only the information for the selected Title Number will be displayed
