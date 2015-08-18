def check_title_search_page_is_displayed
  expect(page).to have_selector('h1', text: 'Search the land and property register')
end

def visit_title_register_page(title_number)
  page.visit("#{$DIGITAL_REGISTER_URL}/titles/#{title_number}")
end

def check_title_summary_page_is_displayed
  expect(content).to include 'Summary of title'
end

def next_page_number
  page_text = page.find('.pagination-prev-next').find('.next-page').text
  page_text.split(' ')[2].to_i
end

def visit_title_register_pdf(title_number)
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
  c.headers['User-Agent'] = grab_user_agent
  c.perform
  c.body_str
ensure
  c.close
end

# gets the user agent from the capybara session
def grab_user_agent
  Capybara.current_session.driver.headers['User-Agent']
end

# Uses header information gathered from capybara to open the pdf
def save_pdf_file(pdf_content)
  File.open('test.pdf', 'wb') { |file| file.puts(pdf_content) }
end
