require 'erubis'
require 'uri'
require 'net/http'
require 'json'
require 'w3c_validators'

include W3CValidators

def login_if_webseal_present
  if $TEST_ENVIRONMENT_WEBSEAL == 'integration' then
    print content
    if page.find('Terminate existing login') then
      print "blah"
      click('Terminate existing login')
    end
    fill_in 'username', with: $WEBSEAL_LOGIN
    fill_in 'password', with: $WEBSEAL_PASSWORD
    click_button('Sign In')
    print content
  end
end

def content
  page.body.text
end

def insert_unverified_title(title_number = 'AGL1013')
  @title = {
    title_number: title_number
  }
  process_title_template(@title, false, 'unverified_title_template')
end

def insert_title_with_owners(number_proprietors = 1, closure_status = 'OPEN', wait_for_updater = true)
  @title = create_title_hash(random_title_number, closure_status)
  @title[:proprietors] = create_non_private_proprietors(number_proprietors)
  process_title_template(@title, wait_for_updater)
  make_title_searchable
end

def insert_title_with_district(number_proprietors = 1, closure_status = 'OPEN', wait_for_updater = true, district)
  @title = create_title_hash(random_title_number, closure_status, 'Freehold', district)
  @title[:proprietors] = create_non_private_proprietors(number_proprietors)
  process_title_template(@title, wait_for_updater)
end

def insert_title_with_address(address_hash)
  @title = create_title_hash(random_title_number, 'OPEN', 'Freehold', 'Wokingham', address_hash)
  @title[:proprietors] = create_non_private_proprietors(1)
  process_title_template(@title)
  make_title_searchable
end

def insert_title_with_private_and_non_private_owners
  @title = create_title_hash(random_title_number)
  @title[:proprietors] = create_non_private_proprietors(1)
  @title[:proprietors] += create_private_proprietors(1)
  process_title_template(@title)
  make_title_searchable
end

def insert_title_with_private_individual_owner(wait_for_updater = true)
  @title = create_title_hash(random_title_number)
  @title[:proprietors] = create_private_proprietors(1)
  process_title_template(@title, wait_for_updater != 'false')
  make_title_searchable
end

def update_closure_status_of_title(closure_status)
  @title[:closure_status] = closure_status
  process_title_template(@title)
end

def insert_title_with_multiple_owner_addresses(number_proprietors = 1, closure_status = 'OPEN', address_types = %w(BFPO FOREIGN UNKNOWN))
  @title = create_title_hash(random_title_number, closure_status)
  @title[:proprietors] = create_non_private_proprietors(number_proprietors, address_types)
  process_title_template(@title)
  make_title_searchable
end

def insert_title_with_no_charges
  @title = create_title_hash(random_title_number)
  @title[:proprietors] = create_non_private_proprietors(1)
  @title[:charges] = create_charges(number_of_charges: 0)
  process_title_template(@title)
  make_title_searchable
end

def insert_title_with_multiple_charges(number_of_charges)
  @title = create_title_hash(random_title_number)
  @title[:proprietors] = create_non_private_proprietors(1)
  @title[:charges] = create_charges(number_of_charges)
  process_title_template(@title)
  make_title_searchable
end

def insert_title_with_a_sub_charge
  @title = create_title_hash(random_title_number)
  @title[:proprietors] = create_non_private_proprietors(1)
  @title[:charges] = create_charges(charge_role_code: %w(CSCH))
  process_title_template(@title)
  make_title_searchable
end

def insert_title_with_multiple_charges_and_addresses(n_of_charge_addresses, number_proprietors: 1)
  @title = create_title_hash(random_title_number)
  @title[:proprietors] = create_non_private_proprietors(number_proprietors)
  @title[:charges] = create_charges(n_of_charge_addresses)
  process_title_template(@title)
  make_title_searchable
end

def insert_title_with_tenure(number_proprietors = 1, tenure_type = 'Freehold')
  @title = create_title_hash(random_title_number, 'OPEN', tenure_type)
  @title[:proprietors] = create_non_private_proprietors(number_proprietors)
  process_title_template(@title)
  make_title_searchable
end

def update_title_with_new_owners(new_proprietor_name)
  @title = create_title_hash(random_title_number)
  @title[:proprietors] = new_proprietor(new_proprietor_name)
  process_title_template(@title)
  make_title_searchable
end

def insert_title_with_owners_different_title(number_proprietors = 1)
  @title = create_title_hash(random_title_number)
  @title[:proprietors] = create_non_private_proprietors(number_proprietors)
  process_title_template(@title)
  make_title_searchable
end

def insert_title_with_number(title_number, wait_for_updater = true)
  @title = create_title_hash(title_number, 'OPEN')
  @title[:proprietors] = create_non_private_proprietors(1)
  process_title_template(@title, wait_for_updater)
  make_title_searchable
end

def insert_title_with_prices_paid(price_paid_hash)
  @title = create_title_hash(random_title_number)
  @title[:proprietors] = create_non_private_proprietors(1)
  @title[:price_paid_stated] = price_paid_hash
  process_title_template(@title)
  make_title_searchable
end

def insert_multiple_titles(number_of_titles)
  number_of_titles.to_i.times do |_|
    insert_title_with_number(random_title_number, false)
  end
  wait_until_elasticsearch_updater_finished
  # Very short final sleep for elasticsearch nodes to be updated
  sleep($ELASTICSEARCH_SLEEP.to_f)
  process_title_template(@title)
end

def random_title_number
  "DN#{rand(1..999_999)}"
end

def create_title_hash(title_number, closure_status = 'OPEN', tenure_type = 'Freehold', district = 'Wokingham', address_hash = {})
  house_number = address_hash.fetch(:house_no, rand(1..99_999).to_s)
  house_alpha = address_hash.fetch(:house_alpha, 'A')
  postcode = address_hash.fetch(:postcode, 'PL9 8TB')
  street_name = address_hash.fetch(:street_name, 'Test Street')
  {
    title_number: title_number,
    street_name: street_name,
    postcode: postcode,
    house_no: house_number,
    house_alpha: house_alpha,
    town: 'Plymouth',
    last_changed: '02 July 1996 at 00:59:59',
    address_string: "#{house_number}#{house_alpha} Test Street, Plymouth, PL9 8TB",
    lr_uprns: rand(1..999_999),
    closure_status: closure_status,
    tenure_type: tenure_type,
    charges: create_charges,
    district: district
  }.merge(address_hash)
end

def process_title_template(title, wait_for_updater = true, template_file = 'title_template')
  file = File.read("./data/#{template_file}.erb")
  eruby = Erubis::Eruby.new(file)
  process_titles_from_data(eruby.result(binding))
  wait_until_elasticsearch_updater_finished if wait_for_updater
  # Very short final sleep for elasticsearch nodes to be updated
  sleep($ELASTICSEARCH_SLEEP.to_f)
  title
end

# connect to the database and execute the sql (that deletes everything)
def delete_all_titles
  $db_connection.exec('DELETE FROM title_register_data;')
end

def delete_all_users
  $user_db_connection.exec('DELETE FROM users;')
end

def delete_all_uprn_data
  $db_connection.exec('DELETE FROM uprn_mapping;')
end

def delete_all_titles_from_elasticsearch
  host = "http://#{$ELASTICSEARCH_HOST}:#{$ELASTICSEARCH_PORT}"
  match_all_query = '{"query": {"bool": {"must": [{"match_all": {}}]}}}'

  doc_types = %w(property_by_postcode_2 property_by_postcode_3 property_by_address)
  doc_types.each do |doc_type|
    uri = URI.parse("#{host}")
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Delete.new("/landregistry/#{doc_type}/_query ",
                                    'Content-Type' => 'application/json')
    request.body = match_all_query
    http.request(request)
  end
end

def create_addressbase_address_elasticsearch
  host = "http://#{$ELASTICSEARCH_HOST}:#{$ELASTICSEARCH_PORT}"
  match_all_query = '{"index": "address-search-api-index", "type": "address_by_postcode", "id":"1", "body": "{"uprn": "123456"}"}'
  doc_types = %w(address-search-api-index)
  doc_types.each do |doc_type|
    uri = URI.parse("#{host}")
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Delete.new("/landregistry/#{doc_type}/_query ",
                                    'Content-Type' => 'application/json')
    request.body = match_all_query
    http.request(request)
  end
end

def clean_register_database
  delete_all_titles
  delete_all_uprn_data
end

def create_non_private_proprietors(number_proprietors, address_types = ['UNKNOWN'])
  proprietors = []
  number_proprietors.times do |i|
    proprietors << {
      name: "Proprietor name #{i + 1}",
      addresses: create_proprietor_addresses(address_types)
    }
  end
  proprietors
end

def create_private_proprietors(number_proprietors, address_types = ['UNKNOWN'])
  proprietors = []
  number_proprietors.times do |i|
    proprietors << {
      forename: "Proprietor forename #{i + 1}",
      surname: "Proprietor surname #{i + 1}",
      addresses: create_proprietor_addresses(address_types),
      type: 'private'
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

def create_charge_company_addresses(n_of_charge_addresses)
  charge_company_addresses = []
  (n_of_charge_addresses.to_i).times do |i|
    charge_company_addresses << {
      address_string: "#{i} Company Address"
    }
  end
  charge_company_addresses
end

def create_charge_entries(n_of_charge_addresses, charge_role_code)
  charge_entries = []
  charge_role_code.each do |i|
    charge_entries << {
      charge_entry_role_code: "#{i}",
      charge_company_name: "#{i} Company Name",
      charge_company_addresses: create_charge_company_addresses(n_of_charge_addresses),
      charge_company_regnumber: '123456'
    }
  end
  charge_entries
end

def create_charges(number_of_charges: 1,
                  charge_role_code: ['CCHR'], n_of_charge_addresses: 1)
  charges = []
  number_of_charges.to_i.times do
    charges << {
      charge: create_charge_entries(n_of_charge_addresses, charge_role_code)
    }
  end
  charges
end

def new_proprietor(new_proprietor_name)
  proprietors = []
  proprietors << {
    name: new_proprietor_name,
    addresses: create_proprietor_addresses(['UK'])
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
  first_successful_sync_times = current_elasticsearch_sync_times
  total_seconds = 0.0
  nof_seconds_to_sleep = $ELASTICSEARCH_SLEEP.to_f
  loop do
    sleep(nof_seconds_to_sleep)
    total_seconds += nof_seconds_to_sleep
    last_successful_sync_times = current_elasticsearch_sync_times
    if total_seconds > 60
      fail("Updater error: its status is #{elasticsearch_status},\nfirst successful sync times were #{first_successful_sync_times},\nlast successful sync times were #{last_successful_sync_times}")
    end
    break if all_times_changed(first_successful_sync_times, last_successful_sync_times)
  end
  sleep(0.6) # elasticsearch changes take a moment
end

def all_times_changed(times1, times2)
  # get list of all updater names and check if all corresponding values in both hashes are different
  updater_names = times1.keys | times2.keys
  updater_names.all? { |name| times1[name] != times2[name] }
end

def current_elasticsearch_sync_times
  # return a hash of updater names and last_successful_sync_time values
  Hash[elasticsearch_status.map { |name, info| [name, info['last_successful_sync_time']] }]
end

def elasticsearch_status
  uri = URI.parse("http://#{$ELASTICSEARCH_UPDATER_HOST}:#{$ELASTICSEARCH_UPDATER_PORT}/status")
  connection = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Get.new(uri)
  response = connection.request(request)
  JSON.parse(response.body)['status']
end

def create_title_addressbase_data(title)
  entry_datetime = DateTime.now
  addressbase_details = {
    postcode: "#{title[:postcode]}",
    post_town: "#{title[:town]}",
    building_number: "#{title[:house_no]}",
    building_name: "#{title[:house_alpha]}",
    thoroughfare_name: "#{title[:street_name]}",
    address_string: "#{title[:address_string]}",
    dependent_thoroughfare_name: 'test',
    department_name: 'test',
    dependent_locality: 'test',
    double_dependent_locality: 'test',
    joined_fields: "#{title[:address_string]}",
    organisation_name: 'test',
    sub_building_name: 'test',
    uprn: "#{title[:lr_uprns]}",
    x_coordinate: 292_772.0,
    y_coordinate: 292_772.0
  }
end

# This inserts an addressbase address into elasticsearch - it needs to have the mapping in place.
def create_elasticsearch_addressbase_data(title_address_data)
  id = title_address_data[:uprn]
  uri = URI.parse("#{$ELASTIC_SEARCH_ENDPOINT}/")
  conn = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Post.new "/#{$ELASTICSEARCH_ADDRESSBASE}/#{$ELASTICSEARCH_POSTCODE_SEARCH}/#{id}"
  request['Content-Type'] = 'application/json'
  request.body = title_address_data.to_json
  response = conn.request(request)
end

# Deletes the index and all data with it - gets called at the beginning of a test
# to prevent brittleness.
def delete_elasticsearch_addressbase_data
  uri = URI.parse("#{$ELASTIC_SEARCH_ENDPOINT}/")
  conn = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Delete.new "#{$ELASTICSEARCH_ADDRESSBASE}/#{$ELASTICSEARCH_POSTCODE_SEARCH}/"
  request['Content-Type'] = 'application/json'
  response = conn.request(request)
end

# Creates an index with the uprn of the addressbase and the title.
def create_lr_urpn_mapping_data(uprn)
  $db_connection.exec("INSERT INTO uprn_mapping(uprn, lr_uprn)VALUES (#{uprn}, #{uprn});")
end

# Overall method to make a title searchable via postcode
def make_title_searchable
  address = create_title_addressbase_data(@title)
  create_elasticsearch_addressbase_data(address)
  sleep(1) # elasticsearch changes take a moment
  create_lr_urpn_mapping_data(@title[:lr_uprns])
end

# Grabs the mapping for the addressbase postcode elasticsearch index
# needs to updated if the elasticsearch index changes
def addressbase_es_mappings
  es_mappings = File.read('features/support/es_mappings.json')
end

# This is the statement to recreate the index mapping
def create_elasticsearch_addressbase_mapping
  index_mapping = addressbase_es_mappings
  uri = URI.parse("#{$ELASTIC_SEARCH_ENDPOINT}/")
  conn = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Put.new "#{$ELASTICSEARCH_ADDRESSBASE}/_mapping/#{$ELASTICSEARCH_POSTCODE_SEARCH}/"
  request['Content-Type'] = 'application/json'
  request.body = index_mapping
  response = conn.request(request)
end
