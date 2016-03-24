@US185
Feature: All reference to OGL removed from footers

As a service provider
I want to ensure that customers are aware that some of the LR data isn't open data
So that we are clear about what is open data and what is not

Remove all reference to OGL from the footers

Acceptance Criteria: All reference to OGL is removed from the footers

Scenario: No reference to OGL in the footers
    Given I have a freehold title
    When I view the title summary page
    Then I can see there is no reference to OGL shown in the footers
