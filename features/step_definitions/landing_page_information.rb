Given(/^I have gone to the digital register view service$/) do
  visit_landing_page
end

Then(/^I can confirm the price of the service will be £(\d+)\.(\d+)$/) do |pounds, pence|
end

Then(/^I am provided information on what the service will provide$/) do
  expect(content).to include('Available from this service',"Available from Land Registry ‘Find a Property’",'Available by post')
end

When(/^I select to use the new service$/) do
  choose("eligibility-1")
  find_button('Continue').click
 end

Then(/^I am redirected to digital register view$/) do
  expect(page).to have_content("You’ll get a summary showing who owns the property, what they paid for it and whether there’s a mortgage on it")
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
  choose("eligibility-3")
  find_button('Continue').click
end

Then(/^I am redirected to the Land Registry information on ordering official copies$/) do
  expect(page).to have_selector(:xpath, "https://www.gov.uk/government/publications/official-copies-of-register-or-plan-registration-oc1")
end

Given(/^I click on the What is title summary link$/) do
  find("summary", :text => "What is the title summary?").click
end

Then(/^I see an explanation of what a Title summary means$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^I click on the What are title documents link$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I see an explanation of what Title documents are$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I make no selection and Contiue$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I am informed that I need to make an option$/) do
  pending # express the regexp above with the code you wish you had
end
