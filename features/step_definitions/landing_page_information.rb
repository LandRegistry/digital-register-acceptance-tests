Given(/^I have gone to the digital register view service$/) do
  visit_landing_page
end

Then(/^I am provided information on what the service will provide$/) do
  expect(content).to include('Available from this service',"Available from Land Registry ‘Find a Property’",'Available by post')
end

When(/^I select to use the new service$/) do
  choose("information", option: "title_summary")
  find_button('Continue').click
 end

Then(/^I am redirected to digital register view$/) do
  webseal_login_check
  expect(page).to have_content("You can get a summary of information about registered property or land in England and Wales, even if you don’t own it.")
end

When(/^I select that I need full title documents$/) do
  choose("information", option: "full_title_documents")
  find_button('Continue').click
end

Then(/^I am redirected to the find a property service$/) do
  #expect(link).to eq('https://eservices.landregistry.gov.uk/wps/portal/Property_Search')
  expect(page).to have_selector(:xpath, "https://eservices.landregistry.gov.uk/wps/portal/Property_Search")
end

When(/^I select that I need Official Copies$/) do
  choose("information", option: "official_copy")
  find_button('Continue').click
end

Then(/^I am redirected to the Land Registry information on ordering official copies$/) do
  expect(page).to have_selector(:xpath, "https://www.gov.uk/government/publications/official-copies-of-register-or-plan-registration-oc1")
end

Given(/^I click on the What is title summary link$/) do
  find("summary", :text => "What is the title summary?").click
end

Then(/^I see an explanation of what a Title summary means$/) do
  expect(page).to have_content("The title summary is available to view online. It gives reduced information from the full register in a clearer, simpler format")
end

Given(/^I click on the What are title documents link$/) do
  find("summary", :text => "What are title documents?").click
end

Then(/^I see an explanation of what Title documents are$/) do
  expect(page).to have_content("Title documents are available in PDF format to download and keep")
end

When(/^I make no selection and Contiue$/) do
  find_button('Continue').click
end

Then(/^I am informed that I need to select an option$/) do
  expect(page).to have_content("Please choose an option")
end
