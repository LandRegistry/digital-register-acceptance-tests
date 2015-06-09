@US034
Feature: View Indexing Polygon on summary page

  As a citizen
  I want to see the index polygon of  the property displayed on a map
  So that I know that I've found the correct property

  Acceptance criteria:
   - Index polygon of the property displayed

  Scenario: View Map on summary page
    Given I am an initial private beta user
    And I have logged in
    And I have a title with multiple index polygons
    When I view the title summary page
    Then I can see the map
