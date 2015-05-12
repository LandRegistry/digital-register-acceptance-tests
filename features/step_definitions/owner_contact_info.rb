Given(/^I have a title with one owner that has property, foreign and BFPO addresses$/) do
  @title_hash = insert_title_with_multiple_owner_contact_details
  page.visit("#{$DIGITAL_REGISTER_URL}/title-search")
  fill_in 'search_term', with: @title_hash[:title_number]
  require 'pry'
  binding.pry
  click_button('Search')

end

Then(/^I can see the owner for the selected title$/) do
  content = page.body.text
  expect(content).to include("crap")
end

Then(/^I can see all the addresses in the order they are displayed on the register$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^I have a title with 3 owners$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the owners have DX and foreign addresses$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I can see all the owners addresses in the order they are displayed on the register$/) do
  pending # express the regexp above with the code you wish you had
end
