Given(/^I am on the search screen$/) do
  check_title_search_page_is_displayed
end

Then(/^the Log out option is available$/) do
  find_link('signout').visible?
end

When(/^I navigate to a register title page$/) do
  insert_title_with_owners
  visit_title_register_page(@title[:title_number])
  
end

When(/^I Log out$/) do
  click_link('signout')
end

Then(/^the Log out option is not available$/) do
  expect(content).not_to include('signout')
end
