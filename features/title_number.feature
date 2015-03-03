Feature: US026 Title Number in the summary box in the digital register

#Acceptance Criteria
 # The title number associated with the property description is displayed in the summary box

@US026 @DigitalRegistry
Scenario: Title number on property title
  Given I am an initial private beta user
  And I have logged in
  And I have a title
  When I view the register details page
  Then I see the title number for the selected title
