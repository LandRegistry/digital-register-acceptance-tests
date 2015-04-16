@US98
Feature: Cookie disclaimer

Scenario: A User is warned that we are using cookies when visiting the site for the first time 
           When I visit the login page
           Then I am informed that we are using cookies

Scenario: No mention of cookies for logged in beta user
           Given I am an initial private beta user
           And I have logged in
           Then no information for cookies is displayed

Scenario: Use of cookies is explained to user
           Given I am an initial private beta user
	         And I have logged in
           When I click on the cookies link
           Then information on cookies is displayed
