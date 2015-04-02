@US88
Feature: Limit the number of failed login attempts

Background:
	Given I am an initial private beta user

Scenario: User is limited to 10 failed login attempts
	Given I have failed to login 10 times
	When I attempt an 11th log in with the correct username and password
	Then I am locked out of the system

Scenario: User is able to login in after User Admin unlocks account
	Given I have failed to login 11 times
	When a User Admin unlocks my account
	Then I can login

Scenario: User will not be locked out of their account after 9 failed logins
	Given I have failed to login 9 times
	When I attempt a 10th correct login
	Then it can correctly logins
