When(/^I navigate to a register title page$/) do
  insert_title_with_owners
  page.visit("#{$DIGITAL_REGISTER_URL}/titles/#{@title[:title_number]}")
end

Then(/^the print option is available$/) do
  find('print-icon').visible?
end

Then(/^I can print the page$/) do
  click('print-icon')
  # TODO add code when we know what happens after link is clicked to print
end
