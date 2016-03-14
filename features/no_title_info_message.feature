@US316
Feature: Explain why some properties do not have title information


As a customer
I want to know why some properties do not have title information
So that I can understand why the information that I want is not available through the DRV service

Add a line to why not all properties are registered (to the 'No title information found -
Why not?' help text???)

Acceptance criteria:
Confirm that properties in the results list where no title information is found has a link to an explanation of why this might have occurred
Confirm that the link in the explanation links to the FaP search page

Scenario: Explanation for properties with no title information
  Given I have a property with no title information
  When I click on the ‘No title information found’ link
  Then I am given an explanation of why this may have occurred
  And a link to the FaP search page is displayed
