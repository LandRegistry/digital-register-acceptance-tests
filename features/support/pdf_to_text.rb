module PDF
  # Converts the obtained PDF to Text
  class PdfToText
    def initialize(pdf_file)
      @receiver = PDF::SimplePageTextReceiver.new
      PDF::Reader.file(pdf_file, @receiver)
    end

    def obtain_text
      @receiver.content.inspect
    end
  end
end
