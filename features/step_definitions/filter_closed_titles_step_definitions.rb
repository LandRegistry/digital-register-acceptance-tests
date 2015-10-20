Given(/^I have an open title$/) do
  closure_status = 'OPEN'
  insert_title_with_owners(1, closure_status)
end

Given(/^I have a closed title$/) do
  closure_status = 'TITLE CLOSED'
  # In this case, do not wait for updater: the title is not inserted
  # because it is closed
  insert_title_with_owners(1, closure_status, false)
  # insert open title with an elasticsearch wait
  # this enables us to check that the elasticsearch updater has had
  # time to run but the title is not visible
  # reset @title to the closed title for the rest of the test
end

Then(/^an unavailable message is displayed$/) do
  expect(content).to include('0 results found')
end

Given(/^I have a recently closed title$/) do
  closure_status = 'OPEN'
  insert_title_with_owners(1, closure_status)
  closure_status = 'TITLE CLOSED'
  update_closure_status_of_title(closure_status)
end

Given(/^the title information is updated$/) do
  new_proprietor_name = 'Nigel Pain PLC'
  update_title_with_new_owners(new_proprietor_name)
end

Then(/^I am able to view the updated information$/) do
  expect(content).to include(@title[:proprietors][0][:name])
end

Then(/^the title summary page is displayed$/) do
  expect(content).to include(@title[:postcode])
  expect(content).to include(@title[:town])
  expect(content).to include("#{@title[:house_no]}#{@title[:house_alpha]} #{@title[:street_name]}")
  expect(content).to include(@title[:title_number])
  expect(content).to include(@title[:proprietors][0][:name])
end
