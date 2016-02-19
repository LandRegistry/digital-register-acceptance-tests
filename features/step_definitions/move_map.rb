Given(/^I have a freehold title$/) do
  insert_title_with_tenure(1, tenure_type = 'Freehold')
end

When(/^I am on the order confirmation page$/) do
  click_link(@title[:address_string])
end

Then(/^I can see an explanation of the freehold tenure$/) do
  find("summary", :text => "Freehold").click
  expect(content).to include ("You own a freehold building and land outright. It is yours until you sell it or give it away.")
end

Then(/^I can see the property indicated on the map$/) do
find("#map")
end

Given(/^I have a leasehold title$/) do
  insert_title_with_tenure(1, tenure_type = 'Leasehold')
end

Then(/^I can see an explanation of the leasehold tenure$/) do
  find("summary", :text => "Leasehold").click
  expect(content).to include ("You only own a leasehold property for a fixed period of time.")
end

Then(/^I can see an explanation of the caution title$/) do
  find("summary", :text => "Caution against first registration").click
  expect(content).to include ("This property hasn’t been registered yet. You can’t find out who owns it from this service.")
end
