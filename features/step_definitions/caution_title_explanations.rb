# On the search results page
When(/^I click on the summary caution against first registration link$/) do
  find("strong.bold", :text => 'Caution against first registration')

  link = find("[href^='#whats-caution-against-first-registration']")
  link.click

  @target = find(link[:href])
end

# On actual title pages
When(/^I expand the caution against first registration details$/) do
  find("summary", :text => "More about cautions against first registration").click

  @target = page
end

Then(/^I see an explanation of what caution title means$/) do
  expect(@target).to have_content('This property hasn’t been registered yet. You can’t find out who owns it from this service.')
end
