Given(/^I have a title$/) do
  insert_title_with_owners
end

Given(/^I do not have a title$/) do
  @title = {
    title_number: 'BAD_TITLE'
  }
  # Do not create the title in the database
end

Given(/^I have a title with an owner$/) do
  insert_title_with_owners
end

Given(/^I have a title with multiple owners$/) do
  insert_title_with_owners(2)
end

Given(/^I have a title with a non private individual owner$/) do
  insert_title_non_private_individual_owner
end

Given(/^I have a title with a charity with trustees that are private individuals$/) do
  insert_title_charity_private_individual_owner
end

Given(/^I have a title with a charity with trustees that are non private individual owners$/) do
  insert_title_charity_non_private_individual_owner
end

Given(/^I have a title with a private individual owner$/) do
  insert_title_with_private_individual_owner
end

Given(/^I have a title with multiple index polygons$/) do
  insert_title_with_multiple_index_polygons
end

Given(/^I have a title with private and non private Individual owners$/) do
  insert_title_with_private_and_non_private_owners
end

Given(/^I have a caution title$/) do
  insert_caution_title
end

Given(/^I have a title that has one mortgage$/) do
  insert_title_with_multiple_charges(number_of_charges: 1)
end

Given(/^I have a title that has multiple mortgages$/) do
  insert_title_with_multiple_charges(number_of_charges: 2)
end

Given(/^I have a title that has one mortgage with multiple addresses$/) do
  insert_title_with_multiple_charges_and_addresses(n_of_charge_addresses: 2)
end

Given(/^I have a title that has a sub mortgage$/) do
  insert_title_with_a_sub_charge
end

Given(/^I have a title with no lenders$/) do
  insert_title_with_no_charges
end

Given(/^I have a title with one owner that has property, foreign and BFPO addresses$/) do
  insert_title_with_multiple_owner_addresses
  visit_property_search_page
  fill_in 'search_term', with: @title[:title_number]
  click_button('Search')
end

Given(/^I have a title with 3 owners$/) do
  insert_title_with_multiple_owner_addresses(3, 'OPEN', %w(BFPO FOREIGN))
end

Given(/^I have searched and found a Title that I want to buy$/) do
  insert_title_with_owners
  visit_title_confirmation_page(@title[:title_number])
end

Given(/^I have multiple addresses on the same street with different house numbers$/) do
  @house_numbers = (1..10).to_a
  shuffled_numbers = @house_numbers.shuffle
  shuffled_numbers.each do |house_no|
    insert_title_with_address(
      house_no: house_no
    )
  end
end

Given(/^I have the following addresses with the same postcode:$/) do |table|
  table.hashes.each do |address_hash|
    symbolised_keys_hash = address_hash.each_with_object({}) do |(key, val), m|
      if val.empty?
        m[key.to_sym] = nil
      else
        m[key.to_sym] = val
      end
      m
    end
    insert_title_with_address(symbolised_keys_hash)
  end
end

Given(/^I have a property with no title information$/) do
  create_address_without_title
  visit_property_search_page
  fill_in 'search_term', with: @title[:postcode]
  click_button('Search')
end
