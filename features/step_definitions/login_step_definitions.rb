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
  Capybara.reset_sessions!
  visit("#{$DIGITAL_REGISTER_URL}/login")
  fill_in 'username', with: @username
  fill_in 'password', with: @password
  click_button('signin')
  expect(content).to include('Find a title')
end

Given(/^I have a valid username and password$/) do
  @username = @new_user['user']['user_id']
  @password = @new_user['user']['password']
end

When(/^I log in$/) do
  login_user(@username, @password)
end

Then(/^I should access the system$/) do
  expect(content).to include('Find a title')
end

Given(/^I have an invalid username and a valid password$/) do
  @username = 'invalid_username'
  @password = @new_user['user']['password']
end

Then(/^I should not access the system$/) do
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
  expect(content).to include('Digital Register Login')
end

Given(/^I have failed to login (\d+) times$/) do |failed_login_times|
  @username = @new_user['user']['user_id']
  @password = 'rubbish_password'
  failed_login_times.to_i.times do
    login_user(@username, @password)
  end
end

When(/^I log in with incorrect credentials$/) do
  @username = @new_user['user']['user_id']
  @password = 'rubbish_password'
  login_user(@username, @password)
end

When(/^I attempt an 11th log in with the correct username and password$/) do
  @password = @new_user['user']['password']
  login_user(@username, @password)
end

Then(/^I am locked out of the system$/) do
  expect(content).to include('There was an error with your Username/Password combination')
end

When(/^a User Admin unlocks my account$/) do
  unlock_user_account(@username)
end

Then(/^I can login$/) do
  @password = @new_user['user']['password']
  login_user(@username, @password)
  expect(content).to include('Find a title')
end

When(/^I attempt a 10th correct login$/) do
  @password = @new_user['user']['password']
  login_user(@username, @password)
end

Then(/^I can see the search page$/) do
  expect(content).to include('Find a title')
end

Given(/^I am a citizen$/) do
  # DO NOTHING
end
