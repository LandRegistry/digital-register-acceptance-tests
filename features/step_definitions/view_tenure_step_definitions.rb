Given(/^I have a title with a tenure of Freehold$/) do
  tenure_type = 'Freehold'
  insert_title_with_tenure(1, tenure_type)
end

Then(/^I see the tenure information in the summary box$/) do
  expect(content).to include(@title[:tenure_type])
end
