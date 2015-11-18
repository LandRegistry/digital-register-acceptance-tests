@US177
Feature: Full register content pdf

If expecting the system to have PDF functionality enabled, tests should be configured to
exclude @pdf-off tags (... --tags ~@pdf-off). Otherwise @pdf-on tags should be excluded (... --tags ~@pdf-on).

Acceptance criteria
  - Must be behind a feature flag
  - Initial design follow version 8 styling - to be covered by manual testing

  Scenario: PDF is accessible when feature flag is turned on
    Given I attempt to view the PDF for a title
    Then the PDF is displayed

  # Should be fixed when we find a way to properly deal with features turned on and off
  @pdf-off
  Scenario: PDF is not accessible via button on title register page when feature flag is turned off
    Given I visit the title register summary page
    Then the PDF Download button is not displayed

  @pdf-on
  Scenario: PDF is accessible via button on title register page when feature flag is turned on
    Given I visit the title register summary page
    Then the PDF Download button is displayed

  @pdf-on
  Scenario: Content of register is displayed on pdf
    Given I attempt to view the PDF for a title
    Then that titles full register is displayed on the PDF
