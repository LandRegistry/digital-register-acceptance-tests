Then(/^no ¬ symbols are displayed$/) do
  expect(content).to have_no_content '¬'
end
