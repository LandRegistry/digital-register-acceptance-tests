Then(/^the page is w3c compliant$/) do
  validate_page(page.body)
end
