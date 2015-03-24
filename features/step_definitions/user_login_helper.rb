def login_user(username, password)
  visit('http://localhost:8003/login')
  fill_in 'username', :with => username
  fill_in 'password', :with => password
  click_button('signin')
end
