Given(/^I navigate directly to a register title page$/) do
  insert_title_with_owners
  visit_title_register_page(@title[:title_number])
  login_if_webseal_present
end

When(/^I navigate to the next page of the results and view the first title$/) do
  previous_page_number = current_page_number
  click_link('Next page')
  expect(current_page_number).to eq(previous_page_number + 1)
  link_text = first('ol.search-results-listing').first('li').first('a').text
  click_link(link_text)
  check_title_summary_page_is_displayed
  expect(content).to include(link_text.delete(','))
end

Then(/^I remain on the Title page I was viewing$/) do
  check_title_summary_page_is_displayed
end

When(/^I select the search results breadcrumb$/) do
  click_link('Search results')
end

Then(/^I am returned to page (\d+) of the search results$/) do |expected_page_num|
  expect(content).to include 'Search results for'
  expect(current_page_number).to eq(expected_page_num.to_i)
end

When(/^I select the initial search breadcrumb$/) do
  click_link('Search the land and property register')
end

Then(/^I am returned to the initial search screen$/) do
  check_title_search_page_is_displayed
end

Then(/^there is no search results breadcrumb$/) do
  expect(content).to have_no_content 'Search results'
end
