Given(/^I have not checked the terms and conditions box$/) do
  # Nothing is done here
end

When(/^I have selected to pay for the summary$/) do
  click_button("Buy title summary")
end

Then(/^I am prevented from going any further$/) do
  expect(content).to include("Confirm your order")
end

Then(/^an error message is displayed$/) do
  expect(content).to include("You need to agree to receive the summary right away and that you’ll lose your right to cancel")
end

Then(/^I can confirm the price of the service will be £(\d+)\.(\d+)$/) do |pounds, pence|
end
