Given(/^I search for a property using the Address$/) do
  visit_property_search_page
  fill_in 'search_term', with: @title[:street_name]
  click_button('Search')
end

Then(/^I can see the caution title result$/) do
  expect(content).to include 'Caution against first registration'
end

When(/^I view the caution title summary page$/) do
  visit_title_register_page(@title[:title_number])
end

Then(/^I can view the register details for the caution title$/) do
  expect(content).to include "#{@title[:title_number]}"
  expect(content).to include "Caution against first registration"
end
