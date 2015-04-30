Before do
  $tables_created ||= false
  return $tables_created if $tables_created
  delete_all_titles_from_elasticsearch # es-updater should recreate
  sleep($ELASTICSEARCH_SLEEP.to_i)
  clean_register_database
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
    delete_all_titles_from_elasticsearch # es-updater should recreate
    clean_register_database
  end
  sleep($ELASTICSEARCH_SLEEP.to_i)
  puts 'Creating user landregistry with password integration'
  @new_user = {}
  @new_user['user'] = {}
  @new_user['user']['user_id'] = 'landregistry'
  @new_user['user']['password'] = 'integration'
  insert_user(@new_user)
  puts 'Creating title DN1000 with postcode PL9 8TB'
  insert_title_with_owners
end
