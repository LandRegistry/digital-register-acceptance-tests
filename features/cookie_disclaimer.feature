@US98
Feature: Cookie disclaimer

Background:
	Given I am an initial private beta user
	And I have logged in

Scenario: A first time User is warned that we are using cookies
  Then I am informed that we are using cookies

Scenario: No mention of cookies for established beta user
  Given I am logging in for a subsequent session
  Then no information for cookies is displayed

Scenario: Use of cookies is explained to a first time User
  When I click on the cookies link
  Then information on cookies is displayed
