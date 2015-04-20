Given(/^I search for a property using the Title Number$/) do
  page.visit("#{$DIGITAL_REGISTER_URL}/title-search/")
  fill_in 'search_term', with: @title_hash[:title_number]
  click_button('Search')
end

Then(/^only the information for the selected Title Number will be displayed$/) do
  content = page.body.text
  expect(content).to include(@title_hash[:title_number])
end

Given(/^I have an address with a single Title Number$/) do
  @title_hash = insert_title_with_owners
end

Given(/^I search for a property using the postcode$/) do
  fill_in 'search_term', with: @title_hash[:postcode]
  click_button('Search')
end

Given(/^I search for a property entering a postcode with no spaces$/) do
  fill_in 'search_term', with: 'PL98TB'
  click_button('Search')
end

Then(/^the address and related title number is displayed$/) do
  content = page.body.text
  expect(content).to include(@title_hash[:postcode])
  expect(content).to include(@title_hash[:title_number])
end

Then(/^I can then view the title register$/) do
  click_link(@title_hash[:address_string])
end

Given(/^I have an address with multiple Title Numbers$/) do
  @title_hash = insert_title_with_owners
  @title_hash2 = insert_title_with_owners_different_title
end

Then(/^the address and related title numbers are displayed$/) do
  content = page.body.text
  expect(content).to include(@title_hash[:postcode])
  expect(content).to include(@title_hash[:title_number])
  expect(content).to include(@title_hash2[:title_number])
end

Then(/^I can view one of the title registers$/) do
  click_link(@title_hash[:address_string])
end

When(/^I search for a property using the whole address$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^only the information for that address will be displayed in the search result$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I search for a property using only the City part of an address$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I can see a maximum of (\d+) addresses included in the search result$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end
