Given(/^I have a title with one price paid or stated entry$/) do
  price_paid_hash = {
    text: 'The value stated as of 2 July 2014 was £205,000.',
    date: '02/07/2014',
    price: '£205,000'
  }
  insert_title_with_prices_paid(price_paid_hash)
end

Given(/^I have a title with no price paid or stated information$/) do
  insert_title_with_prices_paid(nil)
end

Then(/^I can see the price paid or stated$/) do
  latest_price_paid_stated = @title[:price_paid_stated]
  expect(content).to include 'Price paid/stated'
  expect(content).to include latest_price_paid_stated[:text].chomp('.')
end

Then(/^I don't see 'not available' in the price paid or stated part of the page$/) do
  expect(content).to have_no_content 'Price paid/stated'
  expect(content).to have_no_content 'not available'
end
