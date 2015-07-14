Given(/^I search for a property using the Title Number$/) do
  page.visit("#{$DIGITAL_REGISTER_URL}/title-search")
  fill_in 'search_term', with: @title[:title_number]
  click_button('Search')
end

Then(/^only the information for the selected Title Number will be displayed$/) do
  expect(content).to include(@title[:title_number])
end

Given(/^I have an address with a single Title Number$/) do
  insert_title_with_owners
end

Given(/^I search for a property using (?:the|their) postcode$/) do
  fill_in 'search_term', with: @title[:postcode]
  click_button('Search')
end

Given(/^I search for a property entering a postcode with no spaces$/) do
  fill_in 'search_term', with: 'PL98TB'
  click_button('Search')
end

Given(/^I search for a property using no search term$/) do
  click_button('Search')
end

Then(/^the address and related title number is displayed$/) do
  expect(content).to include(@title[:postcode])
  expect(content).to include(@title[:title_number])
end

Then(/^I can then view the title register$/) do
  click_link(@title[:address_string])
end

Given(/^I have an address with multiple Title Numbers$/) do
  @title_1 = insert_title_with_owners
  @title_2 = insert_title_with_owners_different_title
end

Given(/^I have (\d+) addresses in the same City$/) do |number_addresses|
  insert_multiple_titles(number_addresses)
end

Then(/^the address and related title numbers are displayed$/) do
  expect(content).to include(@title[:postcode])
  expect(content).to include(@title[:title_number])
  expect(content).to include(@title[:title_number])
end

Then(/^I can view one of the title registers$/) do
  click_link(@title[:address_string])
end

When(/^I search for a property using the whole address$/) do
  page.visit("#{$DIGITAL_REGISTER_URL}/title-search")
  fill_in 'search_term', with: @title[:address_string]
  click_button('Search')
end

Then(/^I will be displayed a list of results$/) do
  number_results = page.all('ol.search-results-listing > li').count
  expect(number_results).to be >= 1
end

Then(/^they will include the address that has been searched for$/) do
  expect(content).to include(@title[:address_string])
end

When(/^I search for a property using only the City part of an address$/) do
  page.visit("#{$DIGITAL_REGISTER_URL}/title-search")
  fill_in 'search_term', with: 'Plymouth'
  click_button('Search')
end

Then(/^I can see a maximum of (\d+) addresses included in the search result$/) do |n|
  expect(page).to have_content("#{n} results found")
end
