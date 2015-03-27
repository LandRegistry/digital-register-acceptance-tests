def login_user(username, password)
  visit("#{$DIGITAL_REGISTER_URL}/login")
  fill_in 'username', with: username
  fill_in 'password', with: password
  click_button('signin')
end
