Given(/^I navigate directly to a register title page$/) do
  insert_title_with_owners
  page.visit("#{$DIGITAL_REGISTER_URL}/titles/#{@title[:title_number]}")
end

When(/^I view an address on page (\d+) of the results$/) do |expected_page_num|
  @expected_page_num = expected_page_num
  find('.next-page').click
  expect(next_page_number - 1).to eq(@expected_page_num.to_i)
  link_text = first('ol.results').first('li').first('a').text
  click_link(link_text)
  expect(content).to include 'Summary of title'
end

Then(/^I remain on the Title page I was viewing$/) do
  expect(content).to include 'Summary of title'
end

When(/^I select the search results breadcrumb$/) do
  click_link('Search results')
end

Then(/^I am returned to the search results screen and position I was viewing before$/) do
  expect(content).to include 'Search results for'
  page_text = page.find('.pagination-next-number').text
  next_page_num = page_text.split(' ').first.to_i
  expect(next_page_number - 1).to eq(@expected_page_num.to_i)
end

When(/^I select the find a title breadcrumb$/) do
  click_link('Find a title')
end


Then(/^I am returned to the initial search screen$/) do
  expect(content).to include 'Search for the title of any property in England and Wales'
end
