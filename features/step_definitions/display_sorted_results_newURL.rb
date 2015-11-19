Given(/^I have visited the new address search URL$/) do
  # this is pending code amend URL accordingly
  visit("#{$DIGITAL_REGISTER_API}/search")
end

Then(/^the title numbers are not available$/) do
  expect(content).to include 'Title number not available'
end

Then(/^the tenure is not available$/) do
  expect(content).to include 'Tenure not available'
end

Given(/^I have the following addresses with identical postcodes:$/) do |table|
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

Given(/^I search for a property using the postcode$/) do
  fill_in 'search_term', with: @title[:postcode]
  click_button('Search')
end

Then(/^the results should be displayed in the following order:$/) do |table|
  # table is a Cucumber::Ast::Table
  # this is pending code
  displayed_addresses = page.all('ol.search-results-listing > li > h2').map(&:text)
  address_strings = table.hashes.map do |address_hash|
    address_hash[:address_string]
  end
  expect(displayed_addresses).to eq address_strings
end
