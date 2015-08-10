Then(/^I can see the caution title result$/) do
  expect(content).to include 'Caution'
end

Then(/^I can view the register details for the caution title$/) do
  click_link(@title[:address_string])
  expect(content).to include(@title[:postcode])
  expect(content).to include(@title[:title_number])
end

When(/^I attempt to view the pdf$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the pdf is displayed$/) do
  pending # express the regexp above with the code you wish you had
end
