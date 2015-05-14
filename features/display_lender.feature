@US38
Feature: Display Lender(s) Name and Contact Information

Acceptance criteria
 All lenders and their contact details must be displayed
 All lenders must be displayed in the order they are displayed on the register

Background:
	Given I am an initial private beta user
	And I have logged in

Scenario:  Lender details for one mortgage are displayed
  And I have a title that has one mortgage
  When I view the register details page
  Then I can see the Lender’s name in the summary box for the selected title
  And I can see the Lender’s name and contact details as they are displayed on the register

Scenario:  Lender details for multiple mortgages are displayed
  And I have a title that has multiple mortgages
  When I view the register details page
  Then I can see all the Lender’s in the summary box for the selected title
  And I can see all the Lender’s and their contact details in the order they are displayed on the register

@multiple
Scenario:  Lender details for multiple mortgage address are displayed
  And I have a title that has one mortgage with multiple addresses
  When I view the register details page
  Then I can see the Lender’s name in the summary box for the selected title
  And I can see the Lender’s name and contact details as they are displayed on the register

Scenario:  Lender details for sub mortgage are not displayed
  And I have a title that has a sub mortgage
  When I view the register details page
  Then I do not see the sub mortgagor’s name of the in the summary box for the selected title
  And I do not see the sub mortgagor’s name and contact details as they are displayed on the register

Scenario:  No lender information exists
  And I have a title with no lenders
  When I view the register details page
  Then I see a no information with regards to Lenders
