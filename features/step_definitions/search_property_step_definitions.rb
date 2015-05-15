Given(/^I search for a property using the Title Number$/) do
  page.visit("#{$DIGITAL_REGISTER_URL}/title-search")
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

Given(/^I search for a property using no search term$/) do
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

Given(/^I have (\d+) addresses in the same City$/) do |number_addresses|
  number_addresses.to_i.times do |i|
    insert_title_with_number("DN#{i}")
  end
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
  page.visit("#{$DIGITAL_REGISTER_URL}/title-search")
  fill_in 'search_term', with: @title_hash[:address_string]
  click_button('Search')
end

Then(/^I will be displayed a list of results$/) do
  number_results = page.all(:css, 'ol.result > li').count
  expect(number_results).to be >= 1
end

Then(/^they will include the address that has been searched for$/) do
  content = page.body
  expect(content).to include(@title_hash[:address_string])
end

When(/^I search for a property using only the City part of an address$/) do
  page.visit("#{$DIGITAL_REGISTER_URL}/title-search")
  fill_in 'search_term', with: 'Plymouth'
  click_button('Search')
end

Then(/^I can see at least (\d+) addresses included in the search result$/) do |n|
  expect(page).to have_content("#{n} result(s) found")
end

Then(/^I can see a maximum of (\d+) addresses included in the search result$/) do |n|
  number_results = page.all(:css, 'ol.result > li').count
  expect(number_results).to be <= n.to_i
end
