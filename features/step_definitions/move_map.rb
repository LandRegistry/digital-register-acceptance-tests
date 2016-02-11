When(/^I am on the order the title summary page$/) do
   click_link(@title[:address_string])
   expect(content).to include('The summary is a cut-down version of the information Land Registry holds. It costs £2.00 (incl. VAT).')
end

Then(/^I can see the map of the property extent displayed$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I do not see the map displayed$/) do
  pending # express the regexp above with the code you wish you had
end
