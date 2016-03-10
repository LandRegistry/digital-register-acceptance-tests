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
  expect(page).to have_link('Download')
end

When(/^I attempt to view the pdf$/) do
  visit_title_register_pdf(@title[:title_number])
  convert_pdf_to_page
end

Then(/^the PDF is displayed$/) do
  expect(@pdf_pages[0]).to include(@title[:title_number])
end

When(/^I attempt to view the Official Copy of the Register for a title$/) do
  insert_title_non_private_individual_owner
  visit_title_register_pdf(@title[:title_number])
  convert_pdf_to_page
end

Then(/^I can see the edition date in the correct format$/) do
  expect(@pdf_pages[0]).to match('20\s?December\s?2015')
end

Then(/^I can see the dates of the entries on the register in the correct format$/) do
  expect(@pdf_pages[0]).to match('6\s?November\s?1995')
  expect(@pdf_pages[0]).to match('1\s?July\s?1996')
end

Then(/^I can see the class of the title in the proprietorship register$/) do
  expect(@pdf_pages[0]).to match('Title\s?Absolute')
end

Then(/End of register is displayed on the last page of the PDF$/) do
  expect(@pdf_pages[3]).to match('End\s?of\s?Register')
end

Then(/^I can see the Title number of every page$/) do
  expect(@pdf_pages[0]).to include("Title number:#{@title[:title_number]} Page 1")
  expect(@pdf_pages[1]).to include("Title number:#{@title[:title_number]} Page 2")
  expect(@pdf_pages[2]).to include("Title number:#{@title[:title_number]} Page 3")
end

# regex has been used in matching text in the pdf due to odd spacing when parsing
Then(/^I can see "(.*?)" is displayed on the PDF$/) do |legal_text|
  expect(@pdf_pages[0]).to match(legal_text.gsub(' ', '\s?'))
end

Then(/^I can see Land Registry Identification displayed on the top of the PDF$/) do
  date = Date.today.strftime('%-d %B %Y')
  current_date = date.gsub(' ', '\s?')
  expect(@pdf_pages[0]).to match(current_date)
  expect(@pdf_pages[0]).to match('Official\s?copy\s?of\s?register\s?of\s?title\s?Issued\s?by\s?Land\s?Registry\s?on\s?')
end

Then(/^I can see that all entry dates are displayed in the UK format$/) do
  expect(@pdf_pages[0]).to match('6\s?November\s?1995')
  expect(@pdf_pages[0]).to match('1\s?July\s?1996')

  today = Date.today.strftime('%-d %B %Y')
  expect(@pdf_pages[0]).to match(today.gsub(' ', '\s?'))
end

Then(/^I can see that the explanation text "(.*?)" is displayed$/) do |explanation_text|
  text = explanation_text.gsub(' ', '\s?')
  expect(@pdf_pages[0]).to match(text)
end

Given(/^I have a title with the district "(.*?)"$/) do |district|
  insert_title_with_district(district)
end

When(/^I view the Official Copy PDF$/) do
  visit_title_register_pdf(@title[:title_number])
  convert_pdf_to_page
end

Then(/^I can see that the district is displayed$/) do
  expect(@pdf_pages[0]).to match(@title[:district].gsub(' ', '\s?'))
end

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

Then(/^no ¬ symbols are displayed$/) do
  expect(@pdf_pages[1]).not_to include('¬')
end

Then(/^no delimiters are displayed$/) do
  expect(@pdf_pages[0]).not_to include('#', '>', '<', '*', '%', '=')
end
