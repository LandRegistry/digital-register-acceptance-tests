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
