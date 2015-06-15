When(/^I select the search results breadcrumb$/) do
  click_link('Search results')
end

Then(/^I am returned to the search results screen and position I was viewing before$/) do
  expect(content).to include 'Search results for'
end

When(/^I select the find a title breadcrumb$/) do
  click_link('Find a Title')
end

Then(/^I am returned to the initial search screen$/) do
  expect(content).to include 'Search for the title of any property in England and Wales'
end
