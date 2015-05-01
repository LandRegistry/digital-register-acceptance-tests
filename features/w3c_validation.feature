@w3cvalidation
Feature: Check each of the digital register pages is w3c compliant

Scenario: Check the login page is w3c compliant
      Given I visit the login page
      Then the page is w3c compliant

Scenario: Check the search page is w3c compliant
      Given I am an initial private beta user
      When I have logged in
      Then the page is w3c compliant

Scenario: Check the digital register page is w3c compliant
      Given I am an initial private beta user
      And I have logged in
      And I have a title
      When I search for a property using the Title Number
      Then the page is w3c compliant

Scenario: Check the no search results page is w3c compliant
      Given I am an initial private beta user
      And I have logged in
      And I have a closed title
      When I search for a property using the Title Number
      Then the page is w3c compliant

Scenario: Check the search results page is w3c compliant
      Given I am an initial private beta user
      And I have 21 addresses in the same City
      And I have logged in
      When I search for a property using only the City part of an address
      Then the page is w3c compliant

Scenario: Check the cookies page is w3c compliant
      Given I visit the cookies page
      Then the page is w3c compliant
