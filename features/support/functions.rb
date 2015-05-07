require 'erubis'
require 'uri'
require 'net/http'
require 'w3c_validators'

include W3CValidators

def insert_title_with_owners(number_proprietors = 1, closure_status = 'OPEN')
  @title = create_title_hash('DN1000', closure_status)
  @title[:proprietors] = create_proprietors(number_proprietors)
  process_title_template(@title)
end

def update_title_with_new_owners(new_proprietor_name)
  @title = create_title_hash('DN1000')
  @title[:proprietors] = new_proprietor(new_proprietor_name)
  process_title_template(@title)
end

def insert_title_with_owners_different_title(number_proprietors = 1)
  @title = create_title_hash('DN1001')
  @title[:proprietors] = create_proprietors(number_proprietors)
  process_title_template(@title)
end

def insert_title_with_number(title_number)
  @title = create_title_hash(title_number, 'OPEN')
  @title[:proprietors] = create_proprietors(1)
  process_title_template(@title)
end

def create_title_hash(title_number, closure_status = 'OPEN')
  house_number = rand(1..500).to_s
  {
    title_number: title_number,
    street_name: 'Test Street',
    postcode: 'PL9 8TB',
    house_no: house_number,
    town: 'Plymouth',
    last_changed: '02 July 1996 at 00:59:59',
    address_string: "#{house_number} Test Street, Plymouth, PL9 8TB",
    uprn: rand(1000..99_999),
    closure_status: closure_status
  }
end

def process_title_template(title)
  file = File.read('./data/title_template.erb')
  eruby = Erubis::Eruby.new(file)
  File.write('./data/test-generated/title.json', eruby.result(binding))
  process_titles_in_directory('test-generated')
  # Give ElasticSearch time to rerun an election
  sleep($ELASTICSEARCH_SLEEP.to_i)
  title
end

# connect to the database and execute the sql (that deletes everything)
def delete_all_titles
  $db_connection.exec('DELETE FROM title_register_data;')
end

def delete_all_users
  $user_db_connection.exec('DELETE FROM users;')
end

def delete_all_titles_from_elasticsearch
  host = "http://#{$ELASTICSEARCH_HOST}:#{$ELASTICSEARCH_PORT}"
  match_all_query = '{"query": {"bool": {"must": [{"match_all": {}}]}}}'

  doc_types = %w(property_by_postcode property_by_postcode_2 property_by_address)
  doc_types.each do |doc_type|
    `curl -XDELETE #{host}/landregistry/#{doc_type}/_query -d '#{match_all_query}'`
  end
end

def clean_register_database
  delete_all_titles
  delete_all_users
end

def create_proprietors(number_proprietors)
  proprietors = []
  number_proprietors.times do |i|
    proprietors << {
      name: "Proprietor name #{i + 1}",
      address: "Proprietor address #{i + 1}"
    }
  end
  proprietors
end

def new_proprietor(new_proprietor_name)
  proprietors = []
  proprietors << {
    name: new_proprietor_name,
    address: 'Proprietor address'
  }
  proprietors
end

# Function to perform w3c compliance check against the provided page using the w3c_validators gem
def validate_page(page)
  validator = MarkupValidator.new
  results = validator.validate_text(page)
  return unless results.errors.length > 0
  results.errors.each do |err|
    fail("Error #{err.message} on page #{page.current_url}")
  end
end
