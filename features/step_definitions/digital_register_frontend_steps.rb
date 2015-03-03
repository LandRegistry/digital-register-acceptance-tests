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
  # empty the database
  delete_all_titles
  # insert the property_hash data into the database
  @property_hash = {
    :title_number => "DN1000",
    :postcode => "PL9 BLT",
    :street_name => "Test Street",
    :house_no => 13,
    :town => "Plymouth",
    :surname => "Marie",
    :forename => "Hill",
    :name_category => "Personal",
    :full_text => "PROPRIETOR: %MARIE HILL% of Flat 113, Eaton Rise, Eton College Road, *London* NW3 2DD.",
    :last_app_timestamp => "2014-01-28T12:38:58+01:00"
  }
  create_proprietor_title_in_db(@property_hash)
end

Given(/^I do not have a title$/) do
  #TODO: setup delete_all_titles as a hook
  # empty the database
  delete_all_titles
  @property_hash = {
    :title_number => "DN1000"
  }
  #Do not create the title in the database
end

Given(/^I have a title with an owner$/) do
  # empty the database
  delete_all_titles
  # insert the property_hash data into the database
  @property_hash = {
    :title_number => "DN1000",
    :postcode => "NW3 2DD",
    :street_name => "Eaton Rise",
    :house_no => 113,
    :town => "London",
    :surname => "Hill",
    :forename => "Marie",
    :name_category => "Personal",
    :full_text => "PROPRIETOR: %MARIE HILL% of Flat 113, Eaton Rise, Eton College Road, *London* NW3 2DD.",
    :multi_proprietors => "singlePI"
  }
  create_proprietor_title_in_db(@property_hash)
end

Given(/^I have a title with multiple owners$/) do
  # empty the database
  delete_all_titles
  # insert the property_hash data into the database
  @property_hash = {
    :title_number => "DN1000",
    :postcode => "NW3 2DD",
    :street_name => "Eaton Rise",
    :house_no => 113,
    :town => "London",
    :surname => "Hicks",
    :forename => "Fred",
    :name_category => "Personal",
    :full_text => "PROPRIETOR: %FRED HICKS% of Flat 113, Eaton Rise, Eton College Road, *London* NW3 2DD.",
    :multi_proprietors => "TwoPI"
  }
  create_proprietor_title_in_db(@property_hash)
end

Given(/^I have a title with a non private individual owner$/) do
  # empty the database
  delete_all_titles
  title = insert_property_non_private_individual_owner
  @property_hash = title
end

Given(/^I have a title with a charity with trustees that are private individuals$/) do
  # empty the database
  delete_all_titles
  title = insert_property_charity_private_individual_owner
  @property_hash = title
end

Given(/^I have a title with a charity with trustees that are non private individual owners$/) do
  # empty the database
  delete_all_titles
  title = insert_property_charity_non_private_individual_owner
  @property_hash = title
end

Given(/^I have a title with a private individual owner$/) do
  # empty the database
  delete_all_titles
  title = insert_property_private_individual_owner
  @property_hash = title
end

Given(/^the title has multiple index polygons$/) do
  # Update geometry with multiple index polygons
  update_title_geometry_with_multiple_index_polygons("DN1000")
end

##
# Viewing titles
##

When(/^I view the register details page$/) do
  visit("http://landregistry.local:8003/titles/#{@property_hash[:title_number]}")
end

Then(/^I see the full address for the selected title$/) do
  content = page.body.text
  expect(content).to include(@property_hash[:postcode])
  expect(content).to include(@property_hash[:town])
  expect(content).to include("#{@property_hash[:house_no]} #{@property_hash[:street_name]}")
end

Then(/^I see the title number for the selected title$/) do
  content = page.body.text
  expect(content).to include(@property_hash[:title_number])
end

Then(/^I get a page not found message$/) do
  expect(page.status_code).to eq(404)
end

Then(/^I can see who owns the selected title$/) do
  content = page.body.text
  expect(content).to include("#{@property_hash[:forename]} #{@property_hash[:surname]}")
end

Then(/^I can see all the owners for the selected title$$/) do
  content = page.body.text
  expect(content).to include("#{@property_hash[:forename]} #{@property_hash[:surname]}")
  expect(content).to include("#{@property_hash[:forename2]} #{@property_hash[:surname2]}")
  expect(content).to include("#{@property_hash[:forename3]} #{@property_hash[:surname3]}")
  expect(content).to include("#{@property_hash[:forename4]} #{@property_hash[:surname4]}")
end

Then(/^I see the date at which the title was last changed$/) do
  content = page.body.text
  expect(content).to include("28 January 2014 at 12:38:58")
end

Then(/^I can view the register details for the selected title$/) do
  content = page.body.text
  expect(content).to include(@property_hash[:title_number])
  expect(content).to include(@property_hash[:last_changed])
  @property_hash[:owners].each do |owner|
    expect(content).to include(owner)
  end
  expect(content).to include(@property_hash[:postcode])
  expect(content).to include(@property_hash[:town])
  expect(content).to include("#{@property_hash[:house_no]} #{@property_hash[:street_name]}")
end

Then(/^I can see the map in the summary box$/) do
  # Check scale line is displayed to indicate leaflet is being displayed
  page.has_css?("leaflet-control-scale-line")
end

Then(/^I can see all the polygons for that title displayed on the map$/) do
  # DOG & AJ - We tried to do 'something' to check the existance and position of the
  # index polygons but the effort became impracticable so we parked this work.
end
