Given(/^I have multiple addresses on the same street with different house numbers$/) do
  @house_numbers = (1..10).to_a
  shuffled_numbers = @house_numbers.shuffle
  shuffled_numbers.each do |house_no|
    insert_title_with_address(
      house_no: house_no,
      street_name: 'Test Street'
    )
  end
end

Then(/^the results are displayed in the order of the house numbers$/) do
  address_strings = page.all('ol.search-results-listing > li').map(&:text)
  house_numbers = address_strings.map do |address_string|
    address_string.split(' ')[0].to_i
  end
  expect(house_numbers).to eq @house_numbers
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

Then(/^the results should be displayed in the order:$/) do |table|
  displayed_addresses = page.all('ol.search-results-listing > li > h2').map(&:text)
  address_strings = table.hashes.map do |address_hash|
    address_hash[:address_string]
  end
  expect(displayed_addresses).to eq address_strings
end