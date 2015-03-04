Given(/^I am an initial private beta user$/) do
  # do nothing
end

Given(/^I have logged in$/) do
  #TODO: will need to be addressed as part of US53
end

##
# Creating titles
##

Given(/^I have a title$/) do
  @title_hash = insert_title_with_owners
end

Given(/^I do not have a title$/) do
  @title_hash = {
    :title_number => "DN1000"
  }
  #Do not create the title in the database
end

Given(/^I have a title with an owner$/) do
  @title_hash = insert_title_with_owners
end

Given(/^I have a title with multiple owners$/) do
  @title_hash = insert_title_with_owners(2)
end

Given(/^I have a title with a non private individual owner$/) do
  @title_hash = insert_title_non_private_individual_owner
end

Given(/^I have a title with a charity with trustees that are private individuals$/) do
  @title_hash = insert_title_charity_private_individual_owner
end

Given(/^I have a title with a charity with trustees that are non private individual owners$/) do
  @title_hash = insert_title_charity_non_private_individual_owner
end

Given(/^I have a title with a private individual owner$/) do
  @title_hash = insert_title_private_individual_owner
end

Given(/^I have a title with multiple index polygons$/) do
  @title_hash = insert_title_with_multiple_index_polygons
end

##
# Viewing titles
##

When(/^I view the register details page$/) do
  visit("http://landregistry.local:8003/titles/#{@title_hash[:title_number]}")
end

Then(/^I see the full address for the selected title$/) do
  content = page.body.text
  expect(content).to include(@title_hash[:postcode])
  expect(content).to include(@title_hash[:town])
  expect(content).to include("#{@title_hash[:house_no]} #{@title_hash[:street_name]}")
end

Then(/^I see the title number for the selected title$/) do
  content = page.body.text
  expect(content).to include(@title_hash[:title_number])
end

Then(/^I get a page not found message$/) do
  expect(page.status_code).to eq(404)
end

Then(/^I can see who owns the selected title$/) do
  content = page.body.text
  expect(content).to include("#{@title_hash[:proprietors][0][:name]}")
end

Then(/^I can see all the owners for the selected title$$/) do
  content = page.body.text
  expect(content).to include("#{@title_hash[:proprietors][0][:name]}")
  expect(content).to include("#{@title_hash[:proprietors][1][:name]}")
end

Then(/^I see the date at which the title was last changed$/) do
  content = page.body.text
  expect(content).to include(@title_hash[:last_changed])
end

Then(/^I can view the register details for the selected title$/) do
  content = page.body.text
  expect(content).to include(@title_hash[:title_number])
  expect(content).to include(@title_hash[:last_changed])
  @title_hash[:owners].each do |owner|
    expect(content).to include(owner)
  end
  expect(content).to include(@title_hash[:postcode])
  expect(content).to include(@title_hash[:town])
  expect(content).to include("#{@title_hash[:house_no]} #{@title_hash[:street_name]}")
end

Then(/^I can see the map in the summary box$/) do
  # Check scale line is displayed to indicate leaflet is being displayed
  page.has_css?("leaflet-control-scale-line")
end

Then(/^I can see all the polygons for that title displayed on the map$/) do
  # DOG & AJ - We tried to do 'something' to check the existance and position of the
  # index polygons but the effort became impracticable so we parked this work.
end
