Feature: View full address in summary box in digital register

#Acceptance Criteria
 # Be able to display the full address - (for the show and tell)
 # The address must be in the same format as when displayed on the Gov.UK Property Pages
 # If the information relating to the address is not available then a meaningful message must    be displayed

@US033  @ViewFullAddress @DigitalRegistry
Scenario: Full address on property title
  Given I am an initial private beta user
  And I have logged in
  And I have a title
  When I view the register details page
  Then I see the full address for the selected title

@US033 @No_Address_Data @DigitalRegistry
Scenario: No property title available
  Given I am an initial private beta user
  And I have logged in
  And I do not have a title
  When I view the register details page
  Then I get a page not found message
