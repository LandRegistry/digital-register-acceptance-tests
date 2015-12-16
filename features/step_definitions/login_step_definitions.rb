Then(/^I should access the system$/) do
  check_title_search_page_is_displayed
end

Then(/^I should not access the system$/) do
  expect(content).to include('There was an error with your Username/Password combination. If this problem persists please contact us at digital-register-feedback@digital.landregistry.gov.uk')
end

When(/^I view the title search page$/) do
  visit_title_search_page
end

Then(/^I can see the search page$/) do
  check_title_search_page_is_displayed
end
