Given(/^I have a property with no title information$/) do
  create_address_without_title
  visit_title_search_page
  fill_in 'search_term', with: @title[:postcode]
  click_button('Search')
end

When(/^I click on the ‘why not’ link$/) do
  find("summary", :text => "Why not?").click
end

Then(/^a link to the FaP search page is displayed$/) do
  link = find('.search-results-listing a', :text => 'existing Land Registry service')[:href]
  expect(link).to eq('https://eservices.landregistry.gov.uk/wps/portal/Property_Search')
end

Then(/^I am given an explanation of why this may have occurred$/) do
  expect(content).to include('There could be many reasons why we cannot provide you a title number at this time. Try the existing Land Registry service instead')
end
