@US297

Feature: Landing page with information on the service

As a user
I want to know about what the service is and does
so that I don't find this out at the end of my journey and waste my time and money

Acceptance Criteria:
 - The fee for the Summary should be displayed to the customer
 - The information of what is contained in the summary should by shown
 - When I use Title Summary I am redirected to the 'Sign in with your Land Registry account' page
 - When I use Full Title Documents I am redirected to the Find a Property Service
 - When I use Official Copies I am redirected to the 'Order an ‘official copy’ of the register' page on the LR website

Scenario:  The correct information is displayed on the landing page
    Given I have gone to the digital register view service
    Then I can confirm the price of the service will be £3.00
    And I am provided information on what the service will provide

Scenario: Select to use the new service I am redirected to the DRV service
    Given I have gone to the digital register view service
    When I select to use the new service
    Then I am redirected to digital register view

Scenario: Redirected to find a property service
    Given I have gone to the digital register view service
    When I select that I need full title documents
    Then I am redirected to the find a property service

Scenario: Select that Official Copies are needed
    Given I have gone to the digital register view service
    When I select that I need Official Copies
    Then I am redirected to the Land Registry information on ordering official copies
