When(/^I navigate to a register title page pdf$/) do
  insert_title_with_owners
  visit_title_register_pdf(@title[:title_number])
  
  convert_pdf_to_page
end

Then(/^I can see the full text of the register$/) do
  expect(@pdf_pages[1]).to match('A\s?Conveyance\s?dated\s?5\s?September\s?1925\s?made\s?between')
end

Then(/^I can see the date of the register entry$/) do
  expect(@pdf_pages[0]).to match('06\s?November\s?1995')
end

Then(/^I can see the entry number of each entry$/) do
  expect(@pdf_pages[0]).to match('1:')
end
