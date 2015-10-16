@US107
Feature: Log in as existing Find a Property user

As an existing Find a Property registered user
I want to be able to log in to the digital register service
So that I don't have to register again

Acceptance Criteria
- Allow use of existing find a property accounts
- The screen must identify that the user is logged in
- Performance testing - need to ensure using e-security won't impact performance??


  Background:
    Given I am an existing Find a property user


  Scenario: Log in as existing Find a Property registered user
    When I attempt to Log in
    Then I am able to access the service

  Scenario: Log in as existing Find a Property registered user account expired
    And my account has expired
    When I attempt to Log in
    Then I am unable to access the service
    And an explanatory message is displayed
