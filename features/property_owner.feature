Feature: US024 Property Owner in the summary box

@US024 @One_Individual @DigitalRegistry
Scenario: find a single property owner
  Given I am an initial private beta user
  And I have logged in
  And I have a title with an owner
  When I view the register details page
  Then I can see who owns the selected title


@US024 @Multiple_Owners @DigitalRegistry
Scenario: find multiple property owners
  Given I am an initial private beta user
  And I have logged in
  And I have a title with multiple owners
  When I view the register details page
  Then I can see all the owners for the selected title
