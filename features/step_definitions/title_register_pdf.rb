Given(/^the feature flag for full register content is turned on$/) do
  #TODO: Insert code for feature flag
end

Given(/^that I attempt to view the PDF for a title$/) do
  insert_title_with_owners
  require 'pry'
  binding.pry
  visit_title_register_pdf(@title[:title_number])
  convert_pdf_to_page
  puts @pdf_text
end

Then(/^the PDF is displayed$/) do
  expect(content).to include(@title[:title_number])
end

Given(/^the feature flag for full register content is turned off$/) do
  #TODO: Insert code for feature flag
end

Then(/^the PDF is not displayed$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^that titles full register is displayed on the PDF$/) do
  pending # express the regexp above with the code you wish you had
end
