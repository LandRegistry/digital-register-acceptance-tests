Then(/^no delimiters are displayed$/) do
  expect(@pdf_pages[0]).not_to include('#','>','<','*','%','=')
end
