Feature: Search By Title Number

@US049 @DigitalFrontEnd @GovUK
Scenario: Title Number Search
Given I am an initial private beta user
And I have a title
And I have logged in
And I search for a property using the Title Number
When I view the register details page
Then I can view the register details for the selected title
