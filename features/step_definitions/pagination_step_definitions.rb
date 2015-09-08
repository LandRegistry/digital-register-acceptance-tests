Then(/^I can see (\d+) addresses per page$/) do |address_no|
  number_results = page.all('ol.search-results-listing > li').count
  expect(number_results).to eq address_no.to_i
end

Then(/^I can go to the next page \(page (\d+)\)$/) do |expected_page_num|
  click_link('Next page')
  page_text = page.find('#pagination').text
  actual_page_num = page_text.split(' ')
  # This grabs the current page number
  expect(actual_page_num[1].to_i).to eq(expected_page_num.to_i)
end

Then(/^I see we are on page (\d+)$/) do |expected_page_num|
  expect(next_page_number).to eq(expected_page_num.to_i - 1)
end

Then(/^I see the number of pages is (\d+)$/) do |expected_page_num|
  # These lines strip out the last number of the pagination number text.
  page_text = page.find('#pagination').text
  actual_page_num = page_text.split(' ').last.to_i
  expect(actual_page_num).to eq expected_page_num.to_i
end

Then(/^I cannot see pagination details$/) do
  page.assert_no_selector('.pagination-next-number')
end
