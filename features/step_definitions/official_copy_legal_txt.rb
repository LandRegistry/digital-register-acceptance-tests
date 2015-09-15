When(/^I attempt to view the Official Copy of the Register for a title$/) do
	insert_title_non_private_individual_owner
	visit_title_register_pdf(@title[:title_number])
	convert_pdf_to_page
end

Then(/^I can see the edition dates in the correct format$/) do
  expect(@pdf_pages[0]).to include('20 December 2015')
end

Then(/^I can see the dates of the entries on the register in the correct format$/) do
	expect(@pdf_pages[0]).to include('6 November 1995')
	expect(@pdf_pages[0]).to include('28 August 2014')
	expect(@pdf_pages[0]).to include('1 July 2996')
	expect(@pdf_pages[0]).to include('5 September 2005')
end

Then(/^I can see the class of the title in the proprietorship register$/) do
	expect(@pdf_pages[0]).to match('Title\s?Absolute')
end

Then(/End of register is displayed on the last page of the PDF$/) do
	expect(@pdf_pages[3]).to match('End\s?of\s?register')
end

Then(/^I can see the Title number of every page$/) do
	expect(@pdf_pages[0]).to include("Title number:#{@title[:title_number]} Page 1")
	expect(@pdf_pages[1]).to include("Title number:#{@title[:title_number]} Page 2")
	expect(@pdf_pages[2]).to include("Title number:#{@title[:title_number]} Page 3")
end

# regex has been used in matching text in the pdf due to odd spacing when parsing
Then(/^I can see "(.*?)" is displayed on the PDF$/) do |legal_text|
	expect(@pdf_pages[0]).to match(legal_text.gsub(" ", "\s?"))
end

Then(/^I can see Land Registry Identification displayed on the top of the PDF$/) do
	date = Date.today.strftime('%-d %B %Y')
	current_date = date.gsub(" ", "\s?")
	expect(@pdf_pages[0]).to match(current_date)
	expect(@pdf_pages[0]).to match('Official\s?copy\s?of\s?register\s?of\s?title\s?Issued\s?by\s?Land\s?Registry\s?on\s?')
end

Then(/^I can see that all entry dates are displayed in the UK format$/) do
	expect(@pdf_pages[0]).to match('6\s?November\s?1995')
	expect(@pdf_pages[0]).to match('1\s?July\s?1996')
	expect(@pdf_pages[0]).to match('5\s?September\s?2015')
end

Then(/^I can see that the explanation text "(.*?)" is displayed$/) do |explanation_text|
	text = explanation_text.gsub(" ", "\s?")
	expect(@pdf_pages[0]).to match(text)
end
