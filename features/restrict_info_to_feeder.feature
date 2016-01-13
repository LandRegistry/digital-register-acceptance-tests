@US275
Feature: restrict feeder information

As a service provider
I want to ensure that the information in the feeder is restricted to Coventry and Plymouth
So that we are not revealing more information than we should

The flow: -

1) Register publisher pushes everything to feeder queue
2) Feeder restricts to approved regions (a list updated regularly)
3) Feeder pushes to DRV Postgres SQL


Scenario: Unable to view a title with a restricted district
  Given I have a title with the district "City of London"
  When I search for the title
  Then I am unable to view it

Scenario: Unable to select restricted district result
  Given I have a title with the district "City of London"
  And I search for the property using the postcode
  Then I will be displayed a list of results
  And I am unable to see the title number
