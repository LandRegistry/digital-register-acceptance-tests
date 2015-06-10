Then(/^I can see (\d+) addresses per page$/) do |address_no|
  number_results = page.all(:css, 'ol.results > li').count
  expect(number_results).to eq address_no.to_i
end

Then(/^I can go to the next page \(page (\d+)\)$/) do |expected_page_num|
  click_link('Next page')
  page_text = page.find(:css, '.pagination-next-number').text
  next_page_num = page_text.split(' ').first.to_i
  expect(next_page_num).to eq(expected_page_num.to_i + 1)
end

Then(/^I see we are on page (\d+)$/) do |expected_page_num|
  page_text = page.find(:css, '.pagination-next-number').text
  next_page_num = page_text.split(' ').first.to_i
  expect(next_page_num).to eq(expected_page_num.to_i - 1)
end

Then(/^I see the number of pages is (\d+)$/) do |expected_page_num|
  page_text = page.find(:css, '.pagination-next-number').text
  actual_page_num = page_text.split(' ').last.to_i
  expect(actual_page_num).to eq expected_page_num.to_i
end

Then(/^I cannot see pagination details$/) do
  page.should have_no_selector(:css, '.pagination-next-number')
end
