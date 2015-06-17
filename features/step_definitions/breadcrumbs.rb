When(/^I view an address on page (\d+) of the results$/) do |expected_page_num|
  click_on('Next')
  expect(next_page_num).to eq(expected_page_num.to_i = 2)
end

Then(/^I remain on the Title page I was viewing$/) do
  expect(content).to include 'Summary of title'
end

When(/^I select the search results breadcrumb$/) do
  click_link('Search results')
end

Then(/^I am returned to the search results screen and position I was viewing before$/) do
  expect(content).to include 'Search results for'
end

When(/^I select the find a title breadcrumb$/) do
  click_link('Find a title')
end

Then(/^I am returned to the initial search screen$/) do
  expect(content).to include 'Search for the title of any property in England and Wales'
end
