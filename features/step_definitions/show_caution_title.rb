Then(/^I can see the caution title result$/) do
  expect(content).to include 'Caution'
end

When(/^I view the caution title summary page$/) do
  visit_title_register_page(@title[:title_number])
end

Then(/^I can view the register details for the caution title$/) do
  expect(content).to include 'CAUTION AGANIST FIRST REGISTRATION'
end

When(/^I attempt to view the pdf$/) do
  visit_title_register_pdf(@title[:title_number])
  convert_pdf_to_page
end

Then(/^the pdf is displayed$/) do
  expect(@pdf_text[0]).to include(@title[:title_number])
end
