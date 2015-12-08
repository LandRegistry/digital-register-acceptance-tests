Given(/^I visit the cookies page$/) do
  visit("#{$DIGITAL_REGISTER_URL}/cookies")
  login_if_webseal_present
end

Then(/^I am informed that we are using cookies$/) do
  expect(content).to include('Land Registry uses cookies to make the site simpler.')
  find_link('Find out more about cookies').visible?
end

When(/^I click on the cookies link$/) do
  visit("#{$DIGITAL_REGISTER_URL}/cookies")
  login_if_webseal_present
  click_link('Cookies')
end

Then(/^information on cookies is displayed$/) do
  expect(content).to include('The digital register service puts small files (known as ‘cookies’) onto your computer.')
end
