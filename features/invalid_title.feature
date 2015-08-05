@US075
Feature: Handle SOR verification errors

As the service provider
When notified that a title has failed SOR verification I want it removed from the database
so that out of date register information cannot inadvertently be revealed to citizens

Acceptance Criteria
If this is the first time we've seen the (unverified) title, it should not be stored in the database/elasticsearch
If this is a new version of an existing (unverified) title then the previous version/s should be removed from the database/elasticsearch
System log should get a record for each of these scenarios
Removal from the database should happen as soon as we are informed about a SOR verification failure

Background:
	Given I am an initial private beta user
	And I have logged in


Scenario: Valid Title added to database
Given I have a new Valid Title
When I search for the title
Then I am able to view it

Scenario: Invalid title not stored in database
Given I have an invalid title
When I search for the title
Then I am unable to view it

Scenario: New invalid version created
Given I have a invalid version of an existing title
When I search for the title
Then I am unable to view it
