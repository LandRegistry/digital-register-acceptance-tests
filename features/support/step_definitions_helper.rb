def webseal_login_check
  if page.has_content?("Sign in with your Land Registry account")
    fill_in 'username', with: $WEBSEAL_LOGIN
    fill_in 'password', with: $WEBSEAL_PASSWORD
    # tick the 'accept terms and conditions' box
    check 'terms'
    click_button('Sign In')
    if page.has_content?("You are already logged in from another client")
        click_link('Terminate existing login')
    end
  end
end

def purchase_title_summary(title_number)
  visit_title_confirmation_page(title_number)
  pay_for_title_to_view_summary
end

def check_title_search_page_is_displayed
  expect(page).to have_selector('h1', text: 'Search the land and property register')
end

def visit_title_register_page(title_number)
  purchase_title_summary(title_number)
end

def visit_cookie_page
  page.driver.headers = { "User-Agent" => "Mozilla/5.0 (Unknown; Linux i686) AppleWebKit/534.34 (KHTML, like Gecko) PhantomJS/1.9.1 Safari/534.34", "Referer" => "", "iv-user" => "tester_user", "iv-groups" => "psu" }
  visit("#{$DIGITAL_REGISTER_URL}/cookies")
  webseal_login_check
end

def visit_landing_page
  page.driver.headers = { "User-Agent" => "Mozilla/5.0 (Unknown; Linux i686) AppleWebKit/534.34 (KHTML, like Gecko) PhantomJS/1.9.1 Safari/534.34", "Referer" => "", "iv-user" => "tester_user", "iv-groups" => "psu" }
  visit("#{$DIGITAL_REGISTER_URL}/landing-page")
  webseal_login_check
end

def visit_property_search_page
  page.driver.headers = { "User-Agent" => "Mozilla/5.0 (Unknown; Linux i686) AppleWebKit/534.34 (KHTML, like Gecko) PhantomJS/1.9.1 Safari/534.34", "Referer" => "", "iv-user" => "tester_user", "iv-groups" => "psu" }
  visit("#{$DIGITAL_REGISTER_URL}/title-search")
  webseal_login_check
end

def visit_title_confirmation_page(title_number)
  page.driver.headers = { "User-Agent" => "Mozilla/5.0 (Unknown; Linux i686) AppleWebKit/534.34 (KHTML, like Gecko) PhantomJS/1.9.1 Safari/534.34", "Referer" => "", "iv-user" => "tester_user", "iv-groups" => "psu" }
  visit("#{$DIGITAL_REGISTER_URL}/confirm-selection/#{title_number}/PLYMOUTH?display_page_number=1")
  webseal_login_check
end

def visit_terms_and_conditions_page
  page.driver.headers = { "User-Agent" => "Mozilla/5.0 (Unknown; Linux i686) AppleWebKit/534.34 (KHTML, like Gecko) PhantomJS/1.9.1 Safari/534.34", "Referer" => "", "iv-user" => "tester_user", "iv-groups" => "psu" }
  visit("#{$DIGITAL_REGISTER_URL}/terms-and-conditions")
  webseal_login_check
end

def check_title_summary_page_is_displayed
  expect(content).to include 'Summary of title'
end

def check_title_confirmation_page_is_displayed
  expect(content).to include 'Confirm your order'
end

def pay_for_title_to_view_summary
  check("right_to_cancel")
  find(".button", :text => "Buy title summary").click
end

def current_page_number
  page_text = page.find('.next-page .pagination-label').text
  page_text.split(' ').first.to_i - 1
end

def visit_title_register_pdf(title_number)
  page.driver.headers = { "User-Agent" => "Mozilla/5.0 (Unknown; Linux i686) AppleWebKit/534.34 (KHTML, like Gecko) PhantomJS/1.9.1 Safari/534.34", "Referer" => "", "iv-user" => "tester_user", "iv-groups" => "psu" }
  purchase_title_summary(title_number)
  page.visit("#{$DIGITAL_REGISTER_URL}/titles/#{title_number}.pdf")

  cookie = grab_cookies

  pdf_content = get_register_pdf(title_number, cookie)

  save_pdf_file(pdf_content)
end

# gets the cookies from the capybara session
def grab_cookies
  cookie = []
  Capybara.current_session.driver.cookies.each do |key, value|
    cookie.push(key + '=' + value.value)
  end
  cookie
end

# sets the header information to pass on to further code
def get_register_pdf(title_number, cookie)
  c = Curl::Easy.new("#{$DIGITAL_REGISTER_URL}/titles/#{title_number}.pdf")
  c.ssl_verify_peer = false
  c.cookies = cookie.join('; ')
  c.headers = { "User-Agent" => "Mozilla/5.0 (Unknown; Linux i686) AppleWebKit/534.34 (KHTML, like Gecko) PhantomJS/1.9.1 Safari/534.34", "Referer" => "", "iv-user" => "tester_user", "iv-groups" => "psu" }
  c.perform
  c.body_str
ensure
  c.close
end

# Uses header information gathered from capybara to open the pdf
def save_pdf_file(pdf_content)
  File.open('data/test-generated/pdf/test.pdf', 'wb') { |file| file.puts(pdf_content) }
end
