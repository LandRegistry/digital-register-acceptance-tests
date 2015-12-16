Given(/^I try to view a page for a title that doesn't exist$/) do
  page.visit("#{$DIGITAL_REGISTER_URL}/title/badtitle")
end

Then(/^I am displayed a 'page not found' error page$/) do
  expect(content).to include('Page not found')
end
