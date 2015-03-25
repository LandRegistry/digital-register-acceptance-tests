require 'erubis'

def insert_title_with_closure_status(closure_status, number_proprietors=1)
  @title = {
    :title_number => "DN1000",
    :street_name => "Test Street",
    :postcode => "PL9 8TB",
    :house_no => "14",
    :town => "Plymouth",
    :last_changed => "02 July 1996 at 00:59:59",
    :closure_status => closure_status
  }
  @title[:proprietors] = create_proprietors(number_proprietors)
  file = File.read("./data/title_template.erb")
  eruby = Erubis::Eruby.new(file)
  File.write('./data/test-generated/title.json', eruby.result(binding()))
  process_titles_in_directory("test-generated")
  @title
end
