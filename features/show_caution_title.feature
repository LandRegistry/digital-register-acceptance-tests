@US129
Feature: Show caution titles in Digital Register

As a customer
I want to be able to see information relating to caution titles
So that I can find the information that I want

Acceptance Criteria:

How will these be displayed in the search results?

Note:
The following needs to be displayed in the summary box :
i) the address,
ii) the cautioner and
iii) highlight that this is a caution title.


  Background:
	  Given I am an initial private beta user
	  And I have logged in

  Scenario: View caution search result
    Given I have a caution title
    When I search for a property using the postcode
    Then I will be displayed a list of results
    And I can see the caution title result

  Scenario: View caution register summary
    Given I have a caution title
    When I view the caution title summary page
    Then I can view the register details for the caution title

  Scenario: View caution pdf
    Given I have a caution title
    And the feature flag for full register content PDF is turned on
    When I attempt to view the pdf
    Then the pdf is displayed
