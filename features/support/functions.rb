require 'erubis'

def insert_title_with_owners(number_proprietors=1)
  @title = {
    :title_number => "DN1000",
    :street_name => "Test Street",
    :postcode => "PL9 8TB",
    :house_no => "14",
    :town => "Plymouth",
    :last_changed => "02 July 1996 at 00:59:59"
  }
  @title[:proprietors] = create_proprietors(number_proprietors)
  file = File.read("./data/title_template.erb")
  eruby = Erubis::Eruby.new(file)
  File.write('./data/test-generated/title.json', eruby.result(binding()))
  process_titles_in_directory("test-generated")
  @title
end

def insert_title_with_owners_different_title(number_proprietors=1)
  @title = {
    :title_number => "DN1001",
    :street_name => "Test Street",
    :postcode => "PL9 8TB",
    :house_no => "14",
    :town => "Plymouth",
    :last_changed => "02 July 1996 at 00:59:59"
  }
  @title[:proprietors] = create_proprietors(number_proprietors)
  file = File.read("./data/title_template.erb")
  eruby = Erubis::Eruby.new(file)
  File.write('./data/test-generated/title.json', eruby.result(binding()))
  process_titles_in_directory("test-generated")
  @title
end

# connect to the database and execute the sql (that deletes everything)
def delete_all_titles
  $db_connection.exec("DELETE FROM title_register_data;")
  $db_connection.exec("DELETE FROM title_numbers_uprns;")
end

def create_proprietors(number_proprietors)
  proprietors = []
  number_proprietors.times do |i|
    proprietors << {
      :name => "Proprietor name #{i+1}",
      :address => "Proprietor address #{i+1}"
    }
  end
  proprietors
end
