Feature: View Indexing Polygon In Summary Box

  #As a citizen
  #I want to see the index polygon of  the property displayed on a map
  #So that I know that I've found the correct property

  #- Display polygon onto open street map tiles

  #Acceptance criteria
    #Index polygon of the property displayed

@US034 @DigitalFrontEnd @GovUK
Scenario: View Map In Summary Box
  Given I am an initial private beta user
  And I have logged in
  And I have a title with multiple index polygons
  When I view the register details page
  Then I can see the map in the summary box
