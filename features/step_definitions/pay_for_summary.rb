Given(/^I have not checked the terms and conditions box$/) do
  # Nothing is done here
end

When(/^I have selected to pay for the summary$/) do
  find(".button", :text => "Buy title summary").click
end

Then(/^I am prevented from going any further$/) do
  expect(content).to include("Confirm your order")
end

Then(/^an error message is displayed$/) do
  expect(content).to include("You need to agree to receive the summary straight away and that you’ll lose your right to cancel")
end

Then(/^I can confirm the price of the service will be £(\d+)\.(\d+)$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end
