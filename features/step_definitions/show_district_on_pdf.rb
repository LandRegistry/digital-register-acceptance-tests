Then(/^I can see that the district is displayed$/) do
  expect(@pdf_pages[0]).to match('City of Plymouth')
end
