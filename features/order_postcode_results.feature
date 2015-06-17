@US150
Feature: Order Order multiple property search results when searching a  postcode

As a citizen
I want property search results to be displayed in an order that is logical when I do a post code search
So that I can easily identify the property that I am interested in

Note: 'logical' order is 1, 2, 3 etc and not 1, 11, 12 etc

Acceptance criteria:
Only applied when a user has searched a postcode
Results must be displayed in proper numerical order
Results with leading information should be listed after numerical entries in alphabetical order


Background:
	Given I am an initial private beta user
	And I have logged in


Scenario: Search by postcode multiple results displayed in order
  Given I have multiple addresses with the same postcode
  And I search for a property using the postcode
  Then the addresses are displayed in numerical order
  And I can view one of the title registers
