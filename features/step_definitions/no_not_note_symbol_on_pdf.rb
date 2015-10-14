Then(/^no ¬ symbols are displayed$/) do
  expect(@pdf_pages[1]).not_to include('¬')
end
