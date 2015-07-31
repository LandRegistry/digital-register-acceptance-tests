Given(/^I have a new Valid Title$/) do
  insert_title_non_private_individual_owner
end

When(/^I search for the title$/) do
  page.visit("#{$DIGITAL_REGISTER_URL}/title-search")
  fill_in 'search_term', with: @title[:title_number]
  click_button('Search')
end

Then(/^I am able to view it$/) do
  expect(content).to include(@title[:title_number])
end

Given(/^I have an invalid title$/) do
  insert_invalid_title
end

Given(/^I have a invalid version of an existing title$/) do
  insert_title_make_invalid
end

Then(/^I am unable to view it$/) do
  expect(content).to include('0 results found')
end
