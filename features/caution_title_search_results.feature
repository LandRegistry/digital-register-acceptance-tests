@US326
Feature: Definition of caution title

As a customer
I want to see an explanation of what a caution title is when one or more are revealed in a search result
So that I understand what I would be viewing ahead of paying for it

Acceptance Criteria
  - Confirm that caution titles in the results list have a link to an explanation associated with them
  - Confirm that the link in the 'explanatory text links to  https://www.gov.uk/government/publications/caution-against-first-registration/practice-guide-3-cautions-against-first-registration

  Scenario: Search results contain a caution title item
    Given I have a caution title
    When I search for the property using the postcode
    And I click on the Caution against first registration link
    Then I see an explanation of what caution title means

  Scenario: Caution title summary contain a caution title definition
    Given I have a caution title
    When I search for the property using the postcode
    And I view the caution title summary page
    And I click on the Summary Caution against first registration link
    Then I see an explanation of what caution title means
