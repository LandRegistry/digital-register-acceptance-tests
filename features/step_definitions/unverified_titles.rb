When(/^I search for the title$/) do
  page.visit("#{$DIGITAL_REGISTER_URL}/title-search")
  fill_in 'search_term', with: @title[:title_number]
  click_button('Search')
end

Then(/^I am able to view it$/) do
  expect(content).to include(@title[:title_number])
end

Given(/^I have a unverified version of an existing title$/) do
  insert_title_non_private_individual_owner
  insert_unverified_title(@title[:title_number])
end

Then(/^I am unable to view it$/) do
  expect(content).to include('0 results found')
end

Given(/^I have a non verified title$/) do
  insert_unverified_title
end

Given(/^I have a non verified version of an existing title$/) do
  insert_title_non_private_individual_owner
  insert_unverified_title(@title[:title_number])
end
