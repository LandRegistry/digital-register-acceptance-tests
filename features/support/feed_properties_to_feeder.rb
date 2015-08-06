def process_titles_in_directory(data_directory)
  result = `sh consume_register_entries.sh data/#{data_directory}`
  puts result
  puts 'Error creating title' unless $CHILD_STATUS.to_i == 0
end

def insert_caution_title
  process_titles_in_directory('caution')
  @title = {
    title_number: 'AGL1004'
  }
end

def insert_title_with_multiple_index_polygons
  process_titles_in_directory('multiple-index-polygons')
  @title = {
    title_number: 'AGL1005'
  }
end

def insert_title_non_private_individual_owner
  process_titles_in_directory('non-private-individual-owner')
  @title = {
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
  wait_until_elasticsearch_updater_finished
end

def insert_title_charity_non_private_individual_owner
  process_titles_in_directory('charity-non-private-individual-owner')
  @title = {
    title_number: 'AGL1003',
    last_changed: '28 August 2003 at 14:45:50',
    owners: ['HEATHER JONES', 'JOHN JONES', 'HEATHER SMITH'],
    postcode: 'PL9 7FN',
    town: 'Plymouth',
    house_number: 21,
    street_name: 'Murhill Lane',
    closure_status: 'OPEN'
  }
  wait_until_elasticsearch_updater_finished
end

def insert_title_charity_private_individual_owner
  process_titles_in_directory('charity-private-individual-owner')
  @title = {
    title_number: 'AGL1002',
    last_changed: '28 August 2003 at 14:45:50',
    postcode: 'PL9 7FN',
    town: 'Plymouth'
  }
  wait_until_elasticsearch_updater_finished
end

def insert_unverified_title
  process_titles_in_directory('insert_unverified_title')
  @title = {
    title_number: 'AGL1013',
    application_reference: 'J991DWW',
    last_app_timestamp: '2003-08-28T14:45:50+01:00',
    verified: 'false'
  }
end
