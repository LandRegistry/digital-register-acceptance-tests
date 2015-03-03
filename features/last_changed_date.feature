Feature: US027 Last Changed Date

#Acceptance Criteria
 # The date the application was last changed must be displayed

@US027 @DigitalRegistry
Scenario: Last changed date
  Given I am an initial private beta user
  And I have logged in
  And I have a title
  When I view the register details page
  Then I see the date at which the title was last changed
