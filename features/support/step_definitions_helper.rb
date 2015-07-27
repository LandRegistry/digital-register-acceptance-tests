def check_title_search_page_is_displayed
  expect(content).to include('Search for the title of any property in England and Wales')
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

  http = set_header_info(title_number, cookie)

  # puts http.body_str
  open_pdf_file(http)
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
def set_header_info(title_number, cookie)
  Curl.get("#{$DIGITAL_REGISTER_URL}/titles/#{title_number}.pdf") do |http_info|
    http_info.cookies = cookie.join('; ')
    http_info.headers['User-Agent'] = grab_user_agent
    # http_info.header_in_body = true
    # http_info.verbose = true
  end
end

# gets the user agent from the capybara session
def grab_user_agent
  user_agent = Capybara.current_session.driver.headers['User-Agent']
end

# Uses header information gathered from capybara to open the pdf
def open_pdf_file(http)
  File.open('test.pdf', 'wb') { |file| file.puts(http.body_str) }
end
