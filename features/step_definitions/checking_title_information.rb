Given(/^I have a title with a tenure of Freehold$/) do
  tenure_type = 'Freehold'
  insert_title_with_tenure(1, tenure_type)
end

Then(/^I see the tenure information$/) do
  expect(content).to include(@title[:tenure_type])
end

Then(/^I do not see the sub mortgagor’s name and contact details as they are displayed on the register$/) do
  charges_section_verify_charge_company_name_address_not_displayed
end

Then(/^I can see the Lenders and their contact details in the order they are displayed on the register$/) do
  charges_section_verify_charge_company_name_address
end

Then(/^I see a no name or address information with regards to Lenders$/) do
  charges_section_verify_charge_company_name_address_not_displayed
end

Then(/^I can see the owner for the selected title$/) do
  expect(content).to include(@title[:proprietors][0][:name])
end

Given(/^the owners have BFPO and foreign addresses$/) do
  # BFPO and Foreign are default in the previous created address
end

Then(/^I can see all the owners addresses in the order they are displayed on the register$/) do
  address_index = 0
  @title[:proprietors].each_with_index do |proprietor, proprietor_index|
    proprietor[:addresses].each_with_index do |_, index|
      expect(content).to have_content("#{@title[:proprietors][proprietor_index][:addresses][index][:address_string]}")
      address_index += 1
    end
  end
end

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
