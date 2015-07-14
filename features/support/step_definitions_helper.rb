def check_title_search_page_is_displayed
  expect(content).to include('Search for the title of any property in England and Wales')
end

def visit_title_register_page(title_number)
  page.visit("#{$DIGITAL_REGISTER_URL}/titles/#{title_number}")
end

def visit_title_register_pdf(title_number)
  page.visit("#{$DIGITAL_REGISTER_URL}/titles/#{title_number}.pdf")
end

def check_title_summary_page_is_displayed
  expect(content).to include 'Summary of title'
end

def next_page_number
  page_text = page.find('.pagination-prev-next').find('.next-page').text
  page_text.split(' ')[2].to_i
end
