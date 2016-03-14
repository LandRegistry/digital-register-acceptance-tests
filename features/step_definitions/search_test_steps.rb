When(/^I click on the Caution against first registration link$/) do
  find("summary", :text => "What's this?").click
end

Then(/^I see an explanation of what caution title means$/) do
  expect(content).to include('This property hasn’t been registered yet. You can’t find out who owns it from this service.')
end

Then(/^the link in the explanation goes to the gov\.uk explanation page$/) do
  link = find_link('More about cautions against first registration')[:href]
  expect(link).to eq('https://www.gov.uk/government/publications/caution-against-first-registration/practice-guide-3-cautions-against-first-registration')
end

Then(/^the results are displayed in the order of the house numbers$/) do
  address_strings = page.all('ol.search-results-listing > li').map(&:text)
  house_numbers = address_strings.map do |address_string|
    address_string.split(' ')[0].to_i
  end
  expect(house_numbers).to eq @house_numbers
end

Then(/^the results should be displayed in the order:$/) do |table|
  displayed_addresses = page.all('ol.search-results-listing > li > h2').map(&:text)
  address_strings = table.hashes.map do |address_hash|
    address_hash[:address_string]
  end
  expect(displayed_addresses).to eq address_strings
end

When(/^I click on the ‘why not’ link$/) do
  find("summary", :text => "Why not?").click
end

When(/^I click on the ‘No title information found’ link$/) do
  find("summary", :text => "No title information found").click
end


Then(/^a link to the FaP search page is displayed$/) do
  link = find('.search-results-listing a', :text => "searching on the Land Registry ’Find a Property’ service")[:href]
  expect(link).to eq('https://eservices.landregistry.gov.uk/wps/portal/Property_Search')
end

Then(/^I am given an explanation of why this may have occurred$/) do
  expect(content).to include('The property isn’t registered yet. Registration has only been compulsory across England and Wales since the 1990s. If the property hasn’t changed hands since then it may not be registered.')
end

Given(/^I am viewing the search results page$/) do
  visit_property_search_page
  fill_in 'search_term', with: 'PL3 6DR'
  click_button('Search')
end

Then(/^I will be displayed a help message in the sidebar$/) do
  expect(find('#help-sidebar')).to have_content('Help finding the right property')
end

Then(/^I will be able to click a link to get in touch$/) do
  link = find('#help-sidebar a', :text => 'let us know')[:href]
  expect(link).to eq('mailto:digital-register-feedback@digital.landregistry.gov.uk')
end

Then(/^I will be able to click a link to go to FaP$/) do
  link = find('#help-sidebar a', :text => 'existing Land Registry service')[:href]
  expect(link).to eq('https://eservices.landregistry.gov.uk/wps/portal/Property_Search')
end

Then(/^I can see (\d+) addresses per page$/) do |address_no|
  number_results = page.all('ol.search-results-listing > li').count
  expect(number_results).to eq address_no.to_i
end

Then(/^I can go to the next page \(page (\d+)\)$/) do |expected_page_num|
  click_link('Next page')
  # This grabs the current page number
  expect(current_page_number).to eq(expected_page_num.to_i)
end

Then(/^I see we are on page (\d+)$/) do |expected_page_num|
  expect(current_page_number).to eq(expected_page_num.to_i)
end

Then(/^I see the number of pages is (\d+)$/) do |expected_page_num|
  # These lines strip out the last number of the pagination number text.
  page_text = page.find('#pagination').text
  actual_page_num = page_text.split(' ').last.to_i
  expect(actual_page_num).to eq expected_page_num.to_i
end

Then(/^I cannot see pagination details$/) do
  page.assert_no_selector('.pagination-next-number')
end

Given(/^I am on the property search page$/) do
  visit_property_search_page
 end

Given(/^I don’t know the postcode$/) do
  find("summary", :text => "Don't know the postcode?").click
end

When(/^I click the by street address link$/) do
  link = find_link('by title number')[:href]
  expect(link).to eq('https://eservices.landregistry.gov.uk/wps/portal/Property_Search')
end

Then(/^I can access FaP$/) do
  #no code here as covered in previous step
end
