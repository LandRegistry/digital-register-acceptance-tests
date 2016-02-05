@US318
Feature: Help on search results

As a user
I want to know other ways to search for properties when the service doesn't give the search results that I expect
So that I can get the title information I need

Acceptance criteria:
  - Help message displayed in sidebar
  - Link is displayed to enable the user to get in touch
  - Link is displayed to take the user to FaP

  Scenario: Search has not given the expected results
    Given I am viewing the search results page
    Then I will be displayed a help message in the sidebar
    And I will be able to click a link to get in touch
    And I will be able to click a link to go to FaP
