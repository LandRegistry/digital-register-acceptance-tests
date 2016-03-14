When(/^I click on the Summary Caution against first registration link$/) do
  find("summary", :text => "Caution against first registration").click
end

Then(/^the link in the explanation goes to the gov\.uk explanation page$/) do
  link = find_link('More about cautions against first registration')[:href]
  expect(link).to eq('https://www.gov.uk/government/publications/caution-against-first-registration/practice-guide-3-cautions-against-first-registration')
end