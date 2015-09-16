Before do
  $tables_created ||= false
  return $tables_created if $tables_created
  delete_all_titles_from_elasticsearch # es-updater should recreate
  sleep($ELASTICSEARCH_SLEEP.to_f)
  clean_register_database
  set_capybara_session_headers
end

Before('@existing_user') do
  @new_user = {}
  @new_user['user'] = {}
  @new_user['user']['user_id'] = 'username' + timestamp
  @new_user['user']['password'] = 'dummypassword'
  insert_user(@new_user)
end

at_exit do
  puts 'End of Cucumber tests'
  puts 'Recreating tables and indexes'
  unless $tables_created
    clean_register_database
    delete_all_titles_from_elasticsearch # es-updater should recreate
  end
  sleep($ELASTICSEARCH_SLEEP.to_f)
  puts 'Creating user landregistry with password integration'
  @new_user = {}
  @new_user['user'] = {}
  @new_user['user']['user_id'] = 'landregistry'
  @new_user['user']['password'] = 'integration'
  insert_user(@new_user)
  puts 'Creating 51 titles with postcode PL9 8TB'
  # TODO: delete the following line if there is no clear need for it - it's a side effect
  #insert_multiple_titles(51)
end

After do |scenario|
  save_screenshot("data/test-generated/screenshots/sshot-#{Time.new.to_i}.png", full: true) if scenario.failed?
end
