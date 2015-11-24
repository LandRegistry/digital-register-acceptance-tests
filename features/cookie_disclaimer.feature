@US98
Feature: Cookie disclaimer

Scenario: A User is warned that we are using cookies when visiting the site for the first time
  Given I visit the cookies page
  Then I am informed that we are using cookies

Scenario: Use of cookies is explained to user
  When I click on the cookies link
  Then information on cookies is displayed
