When(/^I attempt to view the Official Copy of the Register for a title$/) do
	insert_title_with_owners
	visit_title_register_pdf(@title[:title_number])
	convert_pdf_to_page
end

Then(/^I can see the edition dates in the correct format$/) do
  expect(@pdf_text[0]).to include('20 December 2015')
end

Then(/^I can see the dates of the entries on the register in the correct format$/) do
  expect(@pdf_text[0]).to include('6 November 1995')
	expect(@pdf_text[0]).to include('28 August 2014')
	expect(@pdf_text[0]).to include('1 July 2996')
	expect(@pdf_text[0]).to include('5 September 2005')
end

Then(/^I can see the class of the title in the proprietorship register$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^"(.*?)" is displayed on the last page of the PDF$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I can see the Title number of every page$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I can see "(.*?)" is displayed on the PDF$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I can see "(.*?)" is displayed on the top of the PDF$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I can see that all entry dates are displayed in the UK format$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I can see that the explanation text "(.*?)" is displayed$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end
