When(/^I view the title summary page$/) do
  visit_title_register_page(@title[:title_number])
end

Then(/^I can see there is no reference to OGL shown in the footers$/) do
  expect(content).not_to have_content('Open Government Licence')
end

Then(/^I can see that 'Find property information' is shown in the header$/) do
  expect(find('#global-header')).to have_content('Find property information')
end

When(/^I click on the link$/) do
  find_link('Search for property information').click
end

Then(/^I am returned to the landing page$/) do
expect(content).to include("What information are you looking for?")
end


Then(/^I can see a prompt to provide feedback$/) do
  expect(content).to include("What did you think of this service? Please give us your feedback (takes 30 seconds). This is a new service and your feedback will help us improve it.")
end

Then(/^I see the full address for the selected title$/) do
  expect(content).to include(@title[:postcode])
  expect(content).to include(@title[:town])
  expect(content).to include("#{@title[:house_no]}#{@title[:house_alpha]} #{@title[:street_name]}")
end

Then(/^I see the title number for the selected title$/) do
  expect(content).to include(@title[:title_number])
end

Then(/^I get a page not found message$/) do
  expect(page.status_code).to eq(404)
end

Then(/^I can see who owns the selected title$/) do
  expect(content).to include("#{@title[:proprietors][0][:name]}")
end

Then(/^I can see all the owners for the selected title$$/) do
  expect(content).to include("#{@title[:proprietors][0][:name]}")
  expect(content).to include("#{@title[:proprietors][1][:name]}")
end

Then(/^I see the date at which the title was last changed$/) do
  expect(content).to include(@title[:last_changed])
end

Then(/^I can view the register details for the selected title$/) do
  expect(content).to include(@title[:title_number])
  expect(content).to include(@title[:last_changed])
  if @title[:proprietors]
    @title[:proprietors].each do |proprietor|
      if proprietor[:type] == 'private'
        expect(content).to include(proprietor[:forename])
        expect(content).to include(proprietor[:surname])
      else
        expect(content).to include(proprietor[:name])
      end
    end
  end
  expect(content).to include(@title[:postcode])
  expect(content).to include(@title[:town])
  expect(content).to include("#{@title[:house_no]}#{@title[:house_alpha]} #{@title[:street_name]}")
end

Then(/^I can see the map$/) do
  # Check scale line is displayed to indicate leaflet is being displayed
  page.has_css?('leaflet-control-scale-line')
end

Then(/^I can see all the polygons for that title displayed on the map$/) do
  # DOG & AJ - We tried to do 'something' to check the existance and position of the
  # index polygons but the effort became impracticable so we parked this work.
end

When(/^I navigate to a register title page$/) do
  visit_title_register_page(@title[:title_number])
end
