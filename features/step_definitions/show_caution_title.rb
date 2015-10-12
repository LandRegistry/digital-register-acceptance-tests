Given(/^I search for a property using the Address$/) do
  page.visit("#{$DIGITAL_REGISTER_URL}/title-search")
  fill_in 'search_term', with: @title[:street_name]
  click_button('Search')
end

Then(/^I can see the caution title result$/) do
  expect(content).to include 'Caution against first registration'
end

When(/^I view the caution title summary page$/) do
  click_link(@title[:address_string])
end

Then(/^I can view the register details for the caution title$/) do
  expect(content).to include "Summary of caution title #{@title[:title_number]}"
end

When(/^I attempt to view the pdf$/) do
  visit_title_register_pdf(@title[:title_number])
  convert_pdf_to_page
end

Then(/^the PDF is displayed$/) do
  expect(@pdf_pages[0]).to include(@title[:title_number])
end
