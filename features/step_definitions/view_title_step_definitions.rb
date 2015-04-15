When(/^I view the register details page$/) do
  page.visit("#{$DIGITAL_REGISTER_URL}/titles/#{@title_hash[:title_number]}")
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
  if @title_hash[:proprietors]
    @title_hash[:proprietors].each do |proprietor|
      expect(content).to include(proprietor[:name])
    end
  end
  expect(content).to include(@title_hash[:postcode])
  expect(content).to include(@title_hash[:town])
  expect(content).to include("#{@title_hash[:house_no]} #{@title_hash[:street_name]}")
end

Then(/^I can see the map in the summary box$/) do
  # Check scale line is displayed to indicate leaflet is being displayed
  page.has_css?('leaflet-control-scale-line')
end

Then(/^I can see all the polygons for that title displayed on the map$/) do
  # DOG & AJ - We tried to do 'something' to check the existance and position of the
  # index polygons but the effort became impracticable so we parked this work.
end
