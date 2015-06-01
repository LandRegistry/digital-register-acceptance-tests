Given(/^I am on the search screen$/) do
  expect(content).to include('Find a title')
end

Then(/^the Log out option is available$/) do
  find_link('logout').visible?
end

When(/^I navigate to a register title page$/) do
  insert_title_with_owners
  page.visit("#{$DIGITAL_REGISTER_URL}/titles/#{@title[:title_number]}")
end

Then(/^I am able to Log out$/) do
  click_link('logout')
end

When(/^I Log out$/) do
  click_link('logout')
end

Then(/^the Log out option is not available$/) do
  content.should_not include('logout')
end

When(/^I try to navigate to a title register$/) do
  insert_title_with_owners
  page.visit("#{$DIGITAL_REGISTER_URL}/titles/#{@title[:title_number]}")
end
