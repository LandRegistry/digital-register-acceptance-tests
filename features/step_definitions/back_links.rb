Given(/^I observe the page I am currently on$/) do
  # Record the current URL in a variable local to this scenario
  uri = URI.parse(current_url)
  @observed_url = "#{uri.path}?#{uri.query}"
end

When(/^I click the back link labelled "(.*?)"$/) do |link_label|
  back_links = page.all(:css, '.back-link', :text => link_label)

  # We may have more than 1 back link, so check they are all valid, not just the
  # first one
  back_links.each do |back_link|

    # Links that are specified as "JavaScript only" will have a # in their hrefs
    # Therefore we only check the back link href for links that are *not* js only
    if not back_link[:class].include? 'js-only'
      expect(back_link[:href]).to eq @observed_url
    end

  end

  # Just click the first one
  back_links.first.click
end

Then(/^I am returned to the page I was originally on$/) do

  # Check that the current url matches the URL of the page they were originally on
  uri = URI.parse(current_url)
  expect("#{uri.path}?#{uri.query}").to eq(@observed_url)
end

