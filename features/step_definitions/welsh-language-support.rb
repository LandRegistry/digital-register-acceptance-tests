When(/^I have selected the Welsh translation$/) do
  click_button('in Welsh (Cymraeg)')
end

Then(/^I can view the summary information in Welsh$/) do
  expect(content).to include  'Math o ddaliadaeth'
  expect(content).to include 'Perchennog'
end

When(/^I select the English translation$/) do
  click_button('in English')
end

Then(/^I can view the summary information in English$/) do
  expect(content).to include 'Summary of title'
end
