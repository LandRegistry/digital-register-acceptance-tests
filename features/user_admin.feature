
@US54
Feature: User Admin in Private Beta


Scenario: add a user
Given I am an Admin user
When I add a user
Then the new user is able to log in

@existing_user
Scenario: delete a user
Given I am an Admin user
When I delete an existing user
Then the deleted user is unable to log in

@existing_user
Scenario: reset password can log in
Given I am an Admin user
When I reset a password of an existing user
Then the user is able to log in using the new password

@existing_user
Scenario: reset password can't log in
Given I am an Admin user
When I reset a password of an existing user
Then the user is unable to log in using their old password
