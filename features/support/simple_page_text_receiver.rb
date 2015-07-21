module PDF
  # This parses the pdf to a format that is viewable by capybara
  class SimplePageTextReceiver
    attr_accessor :content

    def initialize
      @content = []
    end

    # Called when page parsing starts
    def begin_page(_arg = nil)
      @content << ''
    end

    # record text that is drawn on the page
    def show_text(string)
      @content.last << string.strip
    end

    # there's a few text callbacks, so make sure we process them all
    alias_method :super_show_text, :show_text
    alias_method :move_to_next_line_and_show_text, :show_text
    alias_method :set_spacing_next_line_show_text, :show_text

    # this final text callback takes slightly different arguments
    def show_text_with_positioning(*params)
      params = params.first
      params.each { |str| show_text(str) if str.is_a?(String) }
    end
  end
end
