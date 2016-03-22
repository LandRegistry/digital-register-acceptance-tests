@US319
Feature: Feedback prompt for users

As a service provider
I want to prompt users to provide feedback once they've completed their journey
So that I can collect customer satisfaction scores and the service can be continually improved from feedback

------------

Text
"What did you think of this service?

Please give us your feedback (takes 30 seconds).
This is a trial service and your feedback will help us improve it."

See prototype and attached screenshot
https://drv-ux-prototype.herokuapp.com/drv-15/summary/2

  Scenario: Feedback prompt on Summary page
   Given I have a title
   And I search for a property using the Title Number
   When I view the title summary page
   Then I can see a prompt to provide feedback
