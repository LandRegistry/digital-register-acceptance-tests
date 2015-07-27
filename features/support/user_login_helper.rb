def login_user(username, password)
  visit("#{$DIGITAL_REGISTER_URL}/login")
  fill_in 'username', with: username
  fill_in 'password', with: password
  click_button('signin')
end

def set_capybara_session_headers
  page.driver.add_header('Referer', '', permanent: true)
  page.driver.add_header('User-Agent', 'Mozilla/5.0 (Unknown; Linux i686) AppleWebKit/534.34 (KHTML, like Gecko) PhantomJS/1.9.1 Safari/534.34', permanent: true)
end
