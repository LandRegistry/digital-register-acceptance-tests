@US053 @DigitalFrontEnd @GovUK
Feature: Private Beta Log In

Background:
  Given I am an initial private beta user

Scenario: A user can log in with the correct user
  Given I have a valid username and password
  When I log in
  Then I should access the system

Scenario: A user cannot log in with an incorrect username
  Given I have an invalid username and a valid password
  When I log in
  Then I should not access the system

Scenario: A user cannot log in with an incorrect password
  Given I have a valid username and an incorrect password
  When I log in
  Then I should not access the system

Scenario: A user cannot view the title search page without logging in.
  Given I haven't logged in
  When I view the title search page
  Then I am redirected to the login page
