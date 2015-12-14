@US275
Feature: restrict feeder information

As a service provider
I want to ensure that the information in the feeder is restricted to Coventry and Plymouth
So that we are not revealing more information than we should

The flow: -

1) Register publisher pushes everything to feeder queue
2) Feeder restricts to approved regions (only Plymouth & Coventry)
3)Feeder pushes to DRV Postgres SQL


Scenario: Unable to search a restricted district
  Given I have a title which has a restricted district of "City of London"
  When I search for the title
  Then I am unable to view it

Scenario: Unable to select restricted district results
  Given I have an address has a restricted district of "City of London"
  When I search for the address
  Then I will be displayed a list of results
  And I am unable to select a result
