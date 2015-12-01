@US275
Feature: restrict feeder information

As a service provider
I want to ensure that the information in the feeder is restricted to Coventry and Plymouth
So that we are not revealing more information than we should

The flow: -

1) Register publisher pushes everything to feeder queue
2) Feeder restricts to approved regions (only Plymouth & Coventry)
3)Feeder pushes to DRV Postgres SQL


Scenario: Unable to search a non Plymouth or Coventry title number
  Given I have an title which is not in a Plymouth or Coventry district
  When I search for the title
  Then I am unable to view it

Scenario: Unable to select non Plymouth or Coventry results
  Given I have an address which is not in a Plymouth or Coventry district
  When I search for the address
  Then I am displayed a list of results
  And I am unable to select a result
