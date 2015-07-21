Given(/^the feature flag for full register content is turned on$/) do
  ENV['SHOW_FULL_TITLE_PDF'] = 'true'
  ENV['SHOW_FULL_TITLE_DATA'] = 'true'
end

Given(/^that I attempt to view the PDF for a title$/) do
  insert_title_with_owners
  visit_title_register_pdf(@title[:title_number])
  convert_pdf_to_page
end

Then(/^the PDF is displayed$/) do
  expect(@pdf_text[0]).to include(@title[:title_number])
end

Given(/^the feature flag for full register content is turned off$/) do
  ENV['SHOW_FULL_TITLE_PDF'] = 'false'
  ENV['SHOW_FULL_TITLE_DATA'] = 'false'
end

Then(/^the PDF Download button is not displayed$/) do
  expect(page).has_no_button?('download-link')
end

Then(/^that titles full register is displayed on the PDF$/) do
  expect(@pdf_text[0]).to include(@title[:title_number])
end
