Given(/^I search for a property using the Address$/) do
  visit_property_search_page
  fill_in 'search_term', with: @title[:street_name]
  click_button('Search')
end

Then(/^I can see the caution title result$/) do
  expect(content).to include 'Caution against first registration'
end

When(/^I view the caution title summary page$/) do
  click_link(@title[:address_string])
  pay_for_title_to_view_summary
end

Then(/^I can view the register details for the caution title$/) do
  expect(content).to include "Summary of caution title #{@title[:title_number]}"
end
