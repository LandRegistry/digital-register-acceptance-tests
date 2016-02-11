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
