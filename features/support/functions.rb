require 'erubis'
require 'uri'
require 'net/http'

def insert_title_with_owners(number_proprietors = 1)
  @title = create_title_hash('DN1000')
  @title[:proprietors] = create_proprietors(number_proprietors)
  process_title_template(@title)
end

def insert_title_with_owners_different_title(number_proprietors = 1)
  @title = create_title_hash('DN1001')
  @title[:proprietors] = create_proprietors(number_proprietors)
  process_title_template(@title)
end

def create_title_hash(title_number)
  house_number = rand(1..500).to_s
  {
    title_number: title_number,
    street_name: 'Test Street',
    postcode: 'PL9 8TB',
    house_no: house_number,
    town: 'Plymouth',
    last_changed: '02 July 1996 at 00:59:59',
    address_string: "#{house_number} Test Street, Plymouth, PL9 8TB",
    uprn: rand(1000..99_999)
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
  $db_connection.exec('DROP TABLE IF EXISTS title_register_data;')
  $db_connection.exec('DROP TABLE IF EXISTS title_numbers_uprns;')
end

def delete_all_users
  $user_db_connection.exec('DROP TABLE IF EXISTS users;')
end

def create_elasticsearch_index
  `sh set_up_elasticsearch.sh`
end

def delete_all_titles_from_elasticsearch
  host = "http://#{$ELASTICSEARCH_HOST}:#{$ELASTICSEARCH_PORT}"
  `curl -XDELETE #{host}/landregistry/property_by_postcode`
end

def create_register_tables
  delete_all_titles
  delete_all_users
  create_title_register_data_table
  create_title_numbers_uprns_table
  create_users_table
end

def create_title_register_data_table
  $db_connection.exec("
CREATE TABLE \"title_register_data\" (
  \"title_number\" character(10),
  \"register_data\" json,
  \"geometry_data\" json
);")
end

def create_title_numbers_uprns_table
  $db_connection.exec("
CREATE TABLE \"title_numbers_uprns\" (
\"title_number\" character (10),
\"uprn\" character(10)
);
CREATE INDEX index_uprn ON title_numbers_uprns(uprn);
CREATE INDEX index_title_number ON title_numbers_uprns(title_number);")
end

def create_users_table
  $user_db_connection.exec("
CREATE TABLE users
(
  user_id character varying(100) NOT NULL,
  password_hash character varying(64),
  failed_logins smallint NOT NULL DEFAULT 0,
  CONSTRAINT user_id_pkey PRIMARY KEY (user_id)
);")
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
