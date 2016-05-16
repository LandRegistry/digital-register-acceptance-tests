Before do
  $tables_created ||= false
  return $tables_created if $tables_created
  delete_all_titles_from_elasticsearch # es-updater should recreate
  clean_register_database
  set_capybara_session_headers
  delete_elasticsearch_addressbase_data
  create_elasticsearch_addressbase_index
  create_elasticsearch_addressbase_mapping
  sleep($ELASTICSEARCH_SLEEP.to_f)
end

at_exit do
  puts 'End of Cucumber tests'
  puts 'Recreating tables and indexes'
  #unless $tables_created
    clean_register_database
    delete_all_titles_from_elasticsearch # es-updater should recreate
    delete_elasticsearch_addressbase_data
    create_elasticsearch_addressbase_index
    create_elasticsearch_addressbase_mapping
  #end
  sleep($ELASTICSEARCH_SLEEP.to_f)
  puts 'Creating titles with postcode PL9 8TB'
  # TODO: delete the following line if there is no clear need for it - it's a side effect
  insert_caution_title
  insert_title_charity_private_individual_owner
  insert_multiple_titles(5)
  create_address_without_title
  puts 'Creating titles with district City of London'
  insert_title_with_district(district = "City of London")
  print @title[:title_number]
end

After do |scenario|
  save_screenshot("data/test-generated/screenshots/sshot-#{Time.new.to_i}.png", full: true) if scenario.failed?
end
