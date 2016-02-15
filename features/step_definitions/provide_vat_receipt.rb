When(/^I choose to buy a title Summary$/) do
  click_link(@title[:address_string])
  pay_for_title_to_view_summary
end

Then(/^I can view the title VAT receipt on the Summary$/) do
   expect(content).to include('VAT receipt')
end

Then(/^it has the correct information$/) do
  #TODO refactor code below when VAT info is dynamic
  expect(content).to include("Date")
  expect(content).to include("Invoice number")
  expect(content).to include("Total inc. VAT")
end

Then(/^I can print the title summary page$/) do
  find('.button-print').visible?
end

Then(/^the VAT receipt is on the printed result$/) do
#Unable to automate this, it will have to be checked manually
end
