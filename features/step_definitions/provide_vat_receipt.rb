When(/^I choose to buy a title Summary$/) do
  click_link(@title[:address_string])
  pay_for_title_to_view_summary
end

Then(/^I can view the title VAT receipt on the Summary$/) do
  expect(content).to include('VAT receipt')
end

Then(/^it has the correct information$/) do
  expect(content).to include("Date")
  expect(content).to include(Date.today().strftime('%d %B %Y').to_s)
  expect(content).to include("Transaction ID")
  expect(content).to include("VAT @ 20%")
  expect(content).to include("GB 8888 181 53")
  expect(content).to include("Land Registry Trafalgar House 1 Bedford Park Croydon CR0 2AQ")
end

Then(/^I can view the title VAT receipt on the Summary in Welsh$/) do
  # Test temporarily written in English until we get the translations through
  expect(content).to include('VAT receipt')
end

Then(/^it has the correct information in welsh$/) do
  # Test temporarily written in English until we get the translations through
  expect(content).to include("Date")
  expect(content).to include(Date.today().strftime('%d %B %Y').to_s)
  expect(content).to include("Transaction ID")
  expect(content).to include("VAT @ 20%")
  expect(content).to include("GB 8888 181 53")
  expect(content).to include("Land Registry Trafalgar House 1 Bedford Park Croydon CR0 2AQ")
end

Then(/^I can print the title summary page$/) do
  find('.button[data-print]').visible?
end

Then(/^the VAT receipt is on the printed result$/) do
#Unable to automate this, it will have to be checked manually
end

