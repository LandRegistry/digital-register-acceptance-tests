@US129
Feature: Show caution titles in Digital Register

As a customer
I want to be able to see information relating to caution titles
So that I can find the information that I want

Note:
The following needs to be displayed in the summary box :
i) the address,
ii) the cautioner and
iii) highlight that this is a caution title.

  Scenario: View caution search result
    Given I have a caution title
    And I search for a property using the Address
    Then I will be displayed a list of results
    And I can see the caution title result

  Scenario: View caution register summary
    Given I have a caution title
    And I search for a property using the Address
    When I view the caution title summary page
    Then I can view the register details for the caution title

  @pdf-on
  Scenario: View caution pdf
    Given I have a caution title
    When I attempt to view the pdf
    Then the PDF is displayed
