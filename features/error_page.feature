@US130

Feature: Provide a front-end error page.

  As a customer
  I want to see a properly styled error page when a processing error occurs
  So that I understand the reason for the problem

Acceptance Criteria:
 - The error page should be returned as a properly styled error page.
 - This should be displayed when a user hits a 404 error (page not found).

Background:
  Given I am an initial private beta user
  And I have logged in

Scenario:
  Given I try to view a page for a title that doesn't exist
  Then I am displayed a 'page not found' error page
