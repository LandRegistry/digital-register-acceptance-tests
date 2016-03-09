Given(/^I have gone to the digital register view service$/) do
  visit_landing_page
end

Then(/^I can confirm the price of the service will be £(\d+)\.(\d+)$/) do |arg1, arg2|
  expect(content).to include('£3 inc VAT')
end

Then(/^I am provided information on what the service will provide$/) do
  expect(content).to include('Available from this service',"Available from Land Registry ‘Find a Property’",'Available by post')
end

When(/^I select to use the new service$/) do
  choose("eligibility-1")
  find_button('Continue').click
 end

Then(/^I am redirected to digital register view$/) do
  visit_property_search_page
end

When(/^I select that I need full title documents$/) do
  choose("eligibility-2")
  find_button('Continue').click
end

Then(/^I am redirected to the find a property service$/) do
  #expect(link).to eq('https://eservices.landregistry.gov.uk/wps/portal/Property_Search')
  expect(page).to have_selector(:xpath, "https://eservices.landregistry.gov.uk/wps/portal/Property_Search")
end

When(/^I select that I need Official Copies$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I am redirected to the Land Registry information on ordering official copies$/) do
  pending # express the regexp above with the code you wish you had
end
