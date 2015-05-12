def process_titles_in_directory(data_directory)
  ENV['REGISTER_FILES_PATH'] = "data/#{data_directory}"
  result = `sh consume_register_entries.sh`
  puts result
  puts 'Error creating title' unless $CHILD_STATUS.to_i == 0
end

def insert_title_with_multiple_index_polygons
  process_titles_in_directory('multiple-index-polygons')
  {
    title_number: 'AGL1005'
  }
end

def insert_title_with_multiple_owner_contact_details
  process_titles_in_directory('private-individual-multiple-contact-info')
  {
    title_number: 'AGL1006',
    postcode: 'PL9 7FN',
    town: 'Plymouth',
    house_number: 21,
    street_name: 'Murhill Lane',
    closure_status: 'OPEN',
    tenure_type: 'Freehold'
  }
end

def insert_title_non_private_individual_owner
  process_titles_in_directory('non-private-individual-owner')
  {
    title_number: 'AGL1000',
    last_changed: '02 July 1996 at 00:59:59',
    owners: ['HEATHER POOLE PLC'],
    postcode: 'PL9 7FN',
    town: 'Plymouth',
    house_number: 21,
    street_name: 'Murhill Lane',
    closure_status: 'OPEN',
    tenure_type: 'Freehold'
  }
end

def insert_title_private_individual_owner
  process_titles_in_directory('private-individual-owner')
  {
    title_number: 'AGL1001'
  }
end

def insert_title_charity_non_private_individual_owner
  process_titles_in_directory('charity-non-private-individual-owner')
  {
    title_number: 'AGL1003',
    last_changed: '28 August 2003 at 14:45:50',
    owners: ['HEATHER JONES', 'JOHN JONES', 'HEATHER SMITH'],
    postcode: 'PL9 7FN',
    town: 'Plymouth',
    house_number: 21,
    street_name: 'Murhill Lane',
    closure_status: 'OPEN'
  }
end

def insert_title_charity_private_individual_owner
  process_titles_in_directory('charity-private-individual-owner')
  {
    title_number: 'AGL1002'
  }
end
