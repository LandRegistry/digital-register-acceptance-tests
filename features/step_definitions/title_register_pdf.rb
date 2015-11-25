Given(/^I attempt to view the PDF for a title$/) do
  insert_title_with_owners
  visit_title_register_pdf(@title[:title_number])
  convert_pdf_to_page
end

Then(/^the PDF Download button is not displayed$/) do
  expect(page).not_to have_link('Download')
end

Then(/^that titles full register is displayed on the PDF$/) do
  expect(@pdf_pages[0]).to include(@title[:title_number])
end

Given(/^I visit the title register summary page$/) do
  insert_title_with_owners
  visit_title_register_page(@title[:title_number])
end

Then(/^the PDF Download button is displayed$/) do
  expect(page).to have_link('download-link')
end
