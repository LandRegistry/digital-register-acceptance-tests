Before do
  $tables_created ||= false
  return $tables_created if $tables_created
  delete_all_titles_from_elasticsearch # es-updater should recreate
  clean_register_database
  set_capybara_session_headers
  delete_elasticsearch_addressbase_data
  create_elasticsearch_addressbase_mapping
  sleep($ELASTICSEARCH_SLEEP.to_f)
  # page.visit("#{$DIGITAL_REGISTER_URL}/title-search")
  # 
end

at_exit do
  puts 'End of Cucumber tests'
  puts 'Recreating tables and indexes'
  unless $tables_created
    clean_register_database
    delete_all_titles_from_elasticsearch # es-updater should recreate
    delete_elasticsearch_addressbase_data
  end
  sleep($ELASTICSEARCH_SLEEP.to_f)
  puts 'Creating 51 titles with postcode PL9 8TB'
  # TODO: delete the following line if there is no clear need for it - it's a side effect
  insert_multiple_titles(51)
end

After do |scenario|
  save_screenshot("data/test-generated/screenshots/sshot-#{Time.new.to_i}.png", full: true) if scenario.failed?
end
