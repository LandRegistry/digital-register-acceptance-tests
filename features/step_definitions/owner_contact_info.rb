Given(/^I have a title with one owner that has property, foreign and BFPO addresses$/) do
  @title_hash = insert_title_with_multiple_owner_addresses
  page.visit("#{$DIGITAL_REGISTER_URL}/title-search")
  fill_in 'search_term', with: @title_hash[:title_number]
  click_button('Search')
end

Then(/^I can see the owner for the selected title$/) do
  content = page.body.text
  expect(content).to include("#{@title_hash[:proprietors][0][:name]}")
end

Then(/^I can see all the addresses in the order they are displayed on the register$/) do
  @title_hash[:proprietors][0][:addresses].each_with_index do |index|
    within('group') do
      expect(page.find("grid grid-1-2:nth-child(#{index})")).to have_content "address string #{@title_hash[:proprietors][0][:addresses]["#{index}"]}"
    end
  end
end

Given(/^I have a title with 3 owners$/) do
  @title_hash = insert_title_with_multiple_owner_addresses(number_proprietors = 3, address_types = ["BFPO", "FOREIGN"])
end

Given(/^the owners have DX and foreign addresses$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I can see all the owners addresses in the order they are displayed on the register$/) do
  pending # express the regexp above with the code you wish you had
end
