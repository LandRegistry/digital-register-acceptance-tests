require 'erubis'
require 'uri'
require 'net/http'
require 'json'
require 'w3c_validators'

include W3CValidators

def insert_title_with_owners(number_proprietors = 1, closure_status = 'OPEN', wait_for_updater = true)
  @title = create_title_hash(random_title_number, closure_status)
  @title[:proprietors] = create_proprietors(number_proprietors)
  process_title_template(@title, wait_for_updater)
end

def update_closure_status_of_title(closure_status)
  @title[:closure_status] = closure_status
  process_title_template(@title)
end

def insert_title_with_multiple_owner_addresses(number_proprietors = 1, closure_status = 'OPEN', address_types = %w(BFPO FOREIGN UNKNOWN))
  @title = create_title_hash(random_title_number, closure_status)
  @title[:proprietors] = create_proprietors(number_proprietors, address_types)
  process_title_template(@title)
end

def insert_title_with_tenure(number_proprietors = 1, tenure_type = 'Freehold')
  @title = create_title_hash('DN1000', 'OPEN', tenure_type)
  @title[:proprietors] = create_proprietors(number_proprietors)
  process_title_template(@title)
end

def update_title_with_new_owners(new_proprietor_name)
  @title = create_title_hash(random_title_number)
  @title[:proprietors] = new_proprietor(new_proprietor_name)
  process_title_template(@title)
end

def insert_title_with_owners_different_title(number_proprietors = 1)
  @title = create_title_hash(random_title_number)
  @title[:proprietors] = create_proprietors(number_proprietors)
  process_title_template(@title)
end

def random_title_number
  "DN#{rand(100..9999)}"
end

def insert_title_with_number(title_number, wait_for_updater = true)
  @title = create_title_hash(title_number, 'OPEN')
  @title[:proprietors] = create_proprietors(1)
  process_title_template(@title, wait_for_updater)
end

def insert_multiple_titles(number_of_titles)
  number_of_titles.to_i.times do |i|
    insert_title_with_number("DN#{i + 1}", false)
  end
  wait_until_elasticsearch_updater_finished
end

def create_title_hash(title_number, closure_status = 'OPEN', tenure_type = 'Freehold')
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
    closure_status: closure_status,
    tenure_type: tenure_type
  }
end

def process_title_template(title, wait_for_updater = true)
  file = File.read('./data/title_template.erb')
  eruby = Erubis::Eruby.new(file)
  File.write('./data/test-generated/title.json', eruby.result(binding))
  process_titles_in_directory('test-generated')
  wait_until_elasticsearch_updater_finished if wait_for_updater
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

def create_proprietors(number_proprietors, address_types = ['UNKNOWN'])
  proprietors = []
  number_proprietors.times do |i|
    proprietors << {
      name: "Proprietor name #{i + 1}",
      addresses: create_proprietor_addresses(address_types)
    }
  end
  proprietors
end

def create_proprietor_addresses(address_types)
  proprietor_addresses = []
  address_types.each do |i|
    proprietor_addresses << {
      address_string: "address string #{i}",
      address_type: "#{i}",
      auto_uppercase_override: true
    }
  end
  proprietor_addresses
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

def wait_until_elasticsearch_updater_finished
  total_seconds = 0
  seconds = $ELASTICSEARCH_SLEEP.to_i
  until title_numbers_all_equal_to_last
    sleep(seconds)
    total_seconds += seconds
    if total_seconds > 30
      fail("Updater error: its status is #{elasticsearch_status}, expected last title is #{@title[:title_number]}") if total_seconds > 30
    end
  end
end

def title_numbers_all_equal_to_last
  title_numbers_updated = last_title_numbers_updated
  title_numbers_updated.map do |title_number|
    title_number == @title[:title_number]
  end.inject(:&)
end

def last_title_numbers_updated
  status = elasticsearch_status
  result = []
  updaters = status.keys
  updaters.each do |updater_name|
    result << status[updater_name]['last_title_number']
  end
  puts "Title: #{@title[:title_number]}"
  puts result
  result
end

def elasticsearch_status
  uri = URI.parse("http://#{$ELASTICSEARCH_UPDATER_HOST}:#{$ELASTICSEARCH_UPDATER_PORT}/status")
  connection = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Get.new(uri)
  response = connection.request(request)
  JSON.parse(response.body)['status']
end
