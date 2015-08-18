Given(/^the feature flag for full register content PDF is turned on$/) do
  ENV['SHOW_FULL_TITLE_PDF'] = 'true'
end

Given(/^that I attempt to view the PDF for a title$/) do
  insert_title_with_owners
  visit_title_register_pdf(@title[:title_number])
  convert_pdf_to_page
end

Then(/^the PDF is displayed$/) do
  expect(@pdf_text[0]).to include(@title[:title_number])
end

Given(/^the feature flag for full register content PDF is turned off$/) do
  ENV['SHOW_FULL_TITLE_PDF'] = 'false'
end

Then(/^the PDF Download button is not displayed$/) do
  expect(page).not_to have_link('download-link')
end

Then(/^that titles full register is displayed on the PDF$/) do
  expect(@pdf_text[0]).to include(@title[:title_number])
end

Given(/^I visit the title register summary page$/) do
  insert_title_with_owners
  visit_title_register_page(@title[:title_number])
end

Then(/^the PDF Download button is displayed$/) do
  expect(page).to have_link('download-link')
end
