@US208
Feature: No delimiters used by internal systems appear on the Official Copy

As a Service Provider
I want to ensure that no delimiters that are used by internal systems appear on the Official Copy
So that the customer is not confused by the erroneous symbols
See MM15083, B1
Note: delimiters are not present on all OC's - see DN642611, B1

Acceptance Criteria
(To be confirmed and full list of delimiters to be provided)

Scenario: No delimiters are displayed
Given I am an initial private beta user
And I have logged in
When I attempt to view the Official Copy of the Register for a title
And the PDF is displayed
Then no delimiters are displayed
