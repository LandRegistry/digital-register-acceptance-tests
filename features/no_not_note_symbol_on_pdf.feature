@US216
Feature: Ensure no ¬ symbols appear on the Official Copy

As a Service Provider
I want to ensure that no ¬ symbols appear on the Official Copy
So that the customer is not confused by erroneous symbols
See DN189134, C6

Acceptance Criteria
(To be confirmed)

Scenario: No ¬ symbols are displayed
Given I am an initial private beta user
And I have logged in
When I attempt to view the Official Copy of the Register which contains a ¬ symbol
And the PDF is displayed
Then no ¬ symbols displayed
