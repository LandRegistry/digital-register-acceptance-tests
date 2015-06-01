Given(/^I am on the search screen$/) do
  expect(content).to include('Find a title')
end

Then(/^the Log out option is available$/) do
  find_link('logout').visible?
end

When(/^I navigate to a register title page$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I am able to Log out$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I Log out$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I am returned to the login screen$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the Log out option is not available$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I try to search for a title$/) do
  pending # express the regexp above with the code you wish you had
end
