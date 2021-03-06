def convert_pdf_to_page
  temp_pdf = Tempfile.new('pdf')
  temp_pdf << page.source.force_encoding('UTF-8')
  reader = PDF::Reader.new('data/test-generated/pdf/test.pdf')
  pdf_text = reader.pages.map(&:text)
  @pdf_pages = []
  pdf_text.each_with_index do |pages, index|
    @pdf_pages << pdf_text[index].gsub("\n", ' ').squeeze(' ')
  end
  @pdf_pages
end
