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

Then(/^I can see the price paid or stated in the summary$/) do
  latest_price_paid_stated = @title[:price_paid_stated]
  label_index = page.all(:css, '#property-summary > dt').map(&:text).find_index('Price paid/stated')
  price_stated = page.all(:css, '#property-summary > dd')[label_index].text
  # the final dot is now removed from PPI information
  expect(price_stated).to eq latest_price_paid_stated[:text].chomp('.')
end

Then(/^I don't see 'not available' in the price paid or stated part of the summary$/) do
  expect(content).to have_no_content 'Price paid/stated'
  expect(content).to have_no_content 'not available'
end
