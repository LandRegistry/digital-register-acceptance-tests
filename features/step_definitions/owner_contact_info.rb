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
  @title_hash[:proprietors][0][:addresses].each_with_index do |_, index|
    within('group') do
      expect(page.find("grid grid-1-2:nth-child(#{index})")).to have_content "address string #{@title_hash[:proprietors][0][:addresses][index]}"
    end
  end
end

Given(/^I have a title with 3 owners$/) do
  @title_hash = insert_title_with_multiple_owner_addresses(3, 'OPEN', %w(BFPO FOREIGN))
end

Given(/^the owners have BFPO and foreign addresses$/) do
  # BFPO and Foreign are default in the previous created address
end

Then(/^I can see all the owners addresses in the order they are displayed on the register$/) do
  address_index = 0
  @title_hash[:proprietors].each_with_index do |proprietor, proprietor_index|
    proprietor[:addresses].each_with_index do |_, index|
      within('group') do
        expect(page.find("grid grid-1-2:nth-child(#{address_index})")).to have_content "address string #{@title_hash[:proprietors][proprietor_index][:addresses][index]}"
      end
      address_index += 1
    end
  end
end
