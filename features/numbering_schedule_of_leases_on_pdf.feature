@US213
Feature: Numbering of schedule entries to be consecutive

As a Service Provider
I want the numbering of the schedule entries to be consecutive
So that the register is correctly formatted
See DN189134

Scenario: Schedule entries numbered consecutively
Given I am an initial private beta user
When I attempt to view the Official Copy of the Register that contains a schedule of leases
And the PDF is displayed
Then I can see that the schedule entries are numbered consecutively
