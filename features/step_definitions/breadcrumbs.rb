Given(/^I navigate directly to a register title page$/) do
  insert_title_with_owners
  visit_title_register_page(@title[:title_number])
end

When(/^I view an address on page (\d+) of the results$/) do |expected_page_num|
  @expected_page_num = expected_page_num
  find('.next-page').click
  expect(next_page_number - 1).to eq(@expected_page_num.to_i)
  link_text = first('ol.results').first('li').first('a').text
  click_link(link_text)
  check_title_summary_page_is_displayed
  expect(content).to include(link_text.gsub(',', ''))
end

Then(/^I remain on the Title page I was viewing$/) do
  check_title_summary_page_is_displayed
end

When(/^I select the search results breadcrumb$/) do
  click_link('Search results')
end

Then(/^I am returned to the search results screen and position I was viewing before$/) do
  expect(content).to include 'Search results for'
  expect(next_page_number - 1).to eq(@expected_page_num.to_i)
end

When(/^I select the find a title breadcrumb$/) do
  click_link('Find a title')
end


Then(/^I am returned to the initial search screen$/) do
  check_title_search_page_is_displayed
end

Then(/^there is no search results breadcrumb$/) do
  expect(content).to have_no_content 'Search results'
end
