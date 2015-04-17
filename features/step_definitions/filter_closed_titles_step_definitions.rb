Given(/^I have an open title$/) do
  closure_status = 'OPEN'
  @title_hash = insert_title_with_owners(1, closure_status)
end

Given(/^I have a closed title$/) do
  closure_status = 'TITLE CLOSED'
  @title_hash = insert_title_with_owners(1, closure_status)
end

Then(/^an unavailable message is displayed$/) do
  content = page.body.text
  expect(content).to include('No result(s) found')
end

Given(/^I have a recently closed title$/) do
  closure_status = 'OPEN'
  @title_hash = insert_title_with_owners(1, closure_status)
  closure_status = 'TITLE CLOSED'
  @title_hash = insert_title_with_owners(1, closure_status)
end

Given(/^the title information is updated$/) do
  new_proprietor_name = 'Nigel Pain PLC'
  @title_hash = update_title_with_new_owners(new_proprietor_name)
end

Then(/^I am able to view the updated information$/) do
  content = page.body.text
  expect(content).to include(@title_hash[:proprietors][0][:name])
end

Then(/^the register details page is displayed$/) do
  content = page.body.text
  expect(content).to include(@title_hash[:postcode])
  expect(content).to include(@title_hash[:town])
  expect(content).to include("#{@title_hash[:house_no]} #{@title_hash[:street_name]}")
  expect(content).to include(@title_hash[:title_number])
  expect(content).to include("#{@title_hash[:proprietors][0][:name]}")
end
