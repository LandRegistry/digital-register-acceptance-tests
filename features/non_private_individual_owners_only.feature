Feature: View Non Private Individuals Only

@US044 @DigitalFrontEnd @GovUK
Scenario: View Non Private Individual
Given I am an initial private beta user
And I have logged in
And I have a title with a non private individual owner
When I view the register details page
Then I can view the register details for the selected title

@US044 @DigitalFrontEnd @GovUK
Scenario: Do Not View Charity Private Individual
Given I am an initial private beta user
And I have logged in
And I have a title with a charity with trustees that are private individuals
When I view the register details page
Then I get a page not found message

@US044 @DigitalFrontEnd @GovUK
Scenario: View Charity Non Private Individual
Given I am an initial private beta user
And I have logged in
And I have a title with a charity with trustees that are non private individual owners
When I view the register details page
Then I can view the register details for the selected title

@US044 @DigitalFrontEnd @GovUK
Scenario: Do Not View Private Individual
Given I am an initial private beta user
And I have logged in
And I have a title with a private individual owner
When I view the register details page
Then I get a page not found message
