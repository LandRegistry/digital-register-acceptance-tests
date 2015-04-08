Transform(/^-?\d+$/) do |number|
  number.to_i
end

Given(/^I am an initial private beta user$/) do
  @new_user = {}
  @new_user['user'] = {}
  @new_user['user']['user_id'] = 'username' + timestamp
  @new_user['user']['password'] = 'dummypassword'
  insert_user(@new_user)
end

Given(/^I have logged in$/) do
  @username = @new_user['user']['user_id']
  @password = @new_user['user']['password']
  visit("#{$DIGITAL_REGISTER_URL}/login")
  fill_in 'username', with: @username
  fill_in 'password', with: @password
  click_button('signin')
  content = page.body.text
  expect(content).to include('Search for Title')
end

##
# Creating titles
##

Given(/^I have a title$/) do
  @title_hash = insert_title_with_owners
end

Given(/^I do not have a title$/) do
  @title_hash = {
    title_number: 'BAD_TITLE'
  }
  # Do not create the title in the database
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

Given(/^I search for a property using the Title Number$/) do
  page.visit("#{$DIGITAL_REGISTER_URL}/title-search/")
  fill_in 'search_term', with: @title_hash[:title_number]
  click_button('Search')
end

Then(/^only the information for the selected Title Number will be displayed$/) do
  content = page.body.text
  expect(content).to include(@title_hash[:title_number])
end

Given(/^I am a citizen$/) do
  # DO NOTHING
end

Given(/^I have an address with a single Title Number$/) do
  @title_hash = insert_title_with_owners
end

Given(/^I have a valid username and password$/) do
  @username = @new_user['user']['user_id']
  @password = @new_user['user']['password']
end

When(/^I log in$/) do
  login_user(@username, @password)
end

Then(/^I should access the system$/) do
  content = page.body.text
  expect(content).to include('Search for Title')
  # TODO: This is to be refactored, not happy with just checking the text on the page
end

Given(/^I have an invalid username and a valid password$/) do
  @username = 'invalid_username'
  @password = @new_user['user']['password']
end

Then(/^I should not access the system$/) do
  content = page.body.text
  expect(content).to include('There was an error with your Username/Password combination. If this problem persists please contact us at digital-register-feedback@digital.landregistry.gov.uk')
end

Given(/^I have a valid username and an incorrect password$/) do
  @username = @new_user['user']['user_id']
  @password = 'invalid_password'
end

Given(/^I haven't logged in$/) do
  # Nothing happens here, the user doesnt log in with the information
end

When(/^I view the title search page$/) do
  visit("#{$DIGITAL_REGISTER_URL}/title-search")
end

Then(/^I am redirected to the login page$/) do
  content = page.body.text
  expect(content).to include('Digital Register Login')
end

Given(/^I am an Admin user$/) do
  # do nothing
end

When(/^I add a user$/) do
  @new_user = {}
  @new_user['user'] = {}
  @new_user['user']['user_id'] = 'username' + timestamp
  @new_user['user']['password'] = 'dummypassword'
  insert_user(@new_user)
end

Then(/^the new user is able to log in$/) do
  @username = @new_user['user']['user_id']
  @password = @new_user['user']['password']
  login_user(@username, @password)
  content = page.body.text
  expect(content).to include('Search for Title')
end

When(/^I delete an existing user$/) do
  user_to_delete = @new_user['user']['user_id']
  delete_user(user_to_delete)
end

Then(/^the deleted user is unable to log in$/) do
  login_user(@username, @password)
  content = page.body.text
  expect(content).to include('Username is required')
  expect(content).to include('Password is required')
end

When(/^I reset a password of an existing user$/) do
  @user_password_to_update = {}
  @user_password_to_update['user'] = {}
  @user_password_to_update['user']['password'] = 'new_password'
  user_id_to_update = @new_user['user']['user_id']
  update_user(@user_password_to_update, user_id_to_update)
end

Then(/^the user is able to log in using the new password$/) do
  @username = @new_user['user']['user_id']
  @password = @user_password_to_update['user']['password']
  login_user(@username, @password)
  content = page.body.text
  expect(content).to include('Search for Title')
end

Then(/^the user is unable to log in using their old password$/) do
  @username = @new_user['user']['user_id']
  @password = @new_user['user']['password']
  login_user(@username, @password)
  content = page.body.text
  expect(content).to include('There was an error with your Username/Password combination')
end

Given(/^I search for a property using the postcode$/) do
  fill_in 'search_term', with: @title_hash[:postcode]
  click_button('Search')
end

Then(/^the address and related title number is displayed$/) do
  content = page.body.text
  expect(content).to include(@title_hash[:postcode])
  expect(content).to include(@title_hash[:title_number])
end

Then(/^I can then view the title register$/) do
  click_link(@title_hash[:address_string])
end

Given(/^I have an address with multiple Title Numbers$/) do
  @title_hash = insert_title_with_owners
  @title_hash2 = insert_title_with_owners_different_title
end

Then(/^the address and related title numbers are displayed$/) do
  content = page.body.text
  expect(content).to include(@title_hash[:postcode])
  expect(content).to include(@title_hash[:title_number])
  expect(content).to include(@title_hash2[:title_number])
end

Then(/^I can view one of the title registers$/) do
  click_link(@title_hash[:address_string])
end

Given(/^I have failed to login (\d+) times$/) do |failed_login_times|
  @username = @new_user['user']['user_id']
  @password = 'rubbish_password'
  failed_login_times.to_i.times do
    login_user(@username, @password)
  end
end

When(/^I attempt an 11th log in with the correct username and password$/) do
  @password = @new_user['user']['password']
  login_user(@username, @password)
end

Then(/^I am locked out of the system$/) do
  content = page.body.text
  expect(content).to include('There was an error with your Username/Password combination')
end

When(/^a User Admin unlocks my account$/) do
  unlock_user_account(@username)
end

Then(/^I can login$/) do
  @password = @new_user['user']['password']
  login_user(@username, @password)
  content = page.body.text
  expect(content).to include('Search for Title')
end

When(/^I attempt a 10th correct login$/) do
  @password = @new_user['user']['password']
  login_user(@username, @password)
end

Then(/^it can correctly logins$/) do
  content = page.body.text
  expect(content).to include('Search for Title')
end

Given(/^I have an open title$/) do
  closure_status = 'OPEN'
  @title_hash = insert_title_with_closure_status(closure_status)
end

Then(/^the register details page is displayed$/) do
  content = page.body.text
  expect(content).to include(@title_hash[:postcode])
  expect(content).to include(@title_hash[:town])
  expect(content).to include("#{@title_hash[:house_no]} #{@title_hash[:street_name]}")
  expect(content).to include(@title_hash[:title_number])
  expect(content).to include("#{@title_hash[:proprietors][0][:name]}")
end

Given(/^I have a closed title$/) do
  closure_status = 'TITLE CLOSED'
  @title_hash = insert_title_with_closure_status(closure_status)
end

Then(/^an unavailable message is displayed$/) do
  content = page.body.text
  expect(content).to include("No result(s) found")
end

Given(/^I have a recently closed title$/) do
  closure_status = 'OPEN'
  @title_hash = insert_title_with_closure_status(closure_status)
  closure_status = 'TITLE CLOSED'
  @title_hash = insert_title_with_closure_status(closure_status)
end

Given(/^the title information is updated$/) do
  new_proprietor_name = 'Nigel Pain PLC'
  @title_hash = update_title_with_new_owners(new_proprietor_name)
end

Then(/^I am able to view the updated information$/) do
  content = page.body.text
  expect(content).to include(@title_hash[:proprietors][0][:name])
end
