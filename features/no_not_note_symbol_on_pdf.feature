@US216
Feature: Ensure no ¬ symbols appear on the Official Copy

As a Service Provider
I want to ensure that no ¬ symbols appear on the Official Copy
So that the customer is not confused by erroneous symbols
See DN189134, C6

Acceptance Criteria
(To be confirmed)

Scenario: No ¬ symbols are displayed
When I attempt to view the Official Copy of the Register for a title
And the PDF is displayed
Then no ¬ symbols are displayed
