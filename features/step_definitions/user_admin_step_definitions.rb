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
  check_title_search_page_is_displayed
end

When(/^I delete an existing user$/) do
  user_to_delete = @new_user['user']['user_id']
  delete_user(user_to_delete)
end

Then(/^the deleted user is unable to log in$/) do
  login_user(@username, @password)
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
  check_title_search_page_is_displayed
end

Then(/^the user is unable to log in using their old password$/) do
  @username = @new_user['user']['user_id']
  @password = @new_user['user']['password']
  login_user(@username, @password)
  expect(content).to include('There was an error with your Username/Password combination')
end
