Then(/^I will be displayed the terms and conditions link in the footer$/) do
  expect(find('#footer')).to have_content('Terms & conditions')
end

Then(/^I will be displayed the terms and conditions link in the check box$/) do
  expect(find("[for='right_to_cancel']")).to have_content('Terms & conditions')
end

When(/^I click the link in the footer to view them$/) do
  find_link('Terms & conditions').click
end

When(/^I click the link in the form to view them$/) do
  find("[for='right_to_cancel'] a", :text => 'Terms & conditions').click
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
  find_link('Terms & conditions').click
end
