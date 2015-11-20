@US222
Feature: Welsh language support on Summary page

As a Welsh language speaker
I want to see information in Welsh on the summary page
So that I can read information on the page in my preferred language

Acceptance Criteria
We are NOT changing the text of the register itself, just the text on the page that presents it. For example, "Owner" should be converted to Welsh but NOT the proprietor information we get from the JSON.
User should be able to switch between English and Welsh languages on the page
Default language should be English.

GOV.UK headers and footers are NOT included in this story (see https://www.gov.uk/archebu-prawf-gyrru-theori )
PDFs of registers are NOT included in this story.
Addresses and the map are NOT included in this story.

Background:
    Given I am an initial private beta user
    And I have logged in
    And I have a title with a private individual owner
    When I view the title summary page
    And I have selected the Welsh translation

Scenario: Option to see info in Welsh on Summary page
    Then I can view the summary information in Welsh

Scenario: Option to switch back to English from Welsh on Summary page
    When I select the English translation
    Then I can view the summary information in English
