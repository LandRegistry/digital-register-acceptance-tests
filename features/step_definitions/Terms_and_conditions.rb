Then(/^I will be displayed the terms and conditions link in the footer$/) do
  expect(find('#footer')).to have_content('Terms and conditions')
end

Then(/^I will be displayed the terms and conditions link in the check box$/) do
  expect(find('#right_to_cancel_group')).to have_content('Terms and Conditions')
end

When(/^I click the link to view them$/) do
  find_link('Terms and conditions').click
end

Then(/^I am taken to the terms and conditions page$/) do
  visit_terms_and_conditions_page
end

Given(/^I am on the terms and conditions page$/) do
  visit_terms_and_conditions_page
end

Then(/^I am provided information on the terms and conditions$/) do
  expect(content).to include("The legal agreements set out below are between you and Land Registry and govern your use of the Title Summary service.")
end

Given(/^I go to the terms and conditions page$/) do
  visit_property_search_page
  find_link('Terms and conditions').click
end

When(/^I click the back button$/) do
  find_link('Back').click
end

Then(/^I am returned to the page I was originally on$/) do
  expect(content).to include("Search the land and property register")
end
