@US54
Feature: User Admin can create, update and delete users in Private Beta

Background:
  Given I am an Admin user

  Scenario: add a user
    Given I add a user
    Then the new user is able to log in

  @existing_user
  Scenario: delete a user
    Given I delete an existing user
    Then the deleted user is unable to log in

  @existing_user
  Scenario: reset password can log in
    Given I reset a password of an existing user
    Then the user is able to log in using the new password

  @existing_user
  Scenario: reset password can't log in
    Given I reset a password of an existing user
    Then the user is unable to log in using their old password
