Before do
  $tables_created ||= false
  return $tables_created if $tables_created
  create_elasticsearch_index
  delete_all_titles_from_elasticsearch
  create_register_tables
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
    create_elasticsearch_index
    delete_all_titles_from_elasticsearch
    create_register_tables
  end
  puts 'Creating user landregistry with password integration'
  @new_user = {}
  @new_user['user'] = {}
  @new_user['user']['user_id'] = 'landregistry'
  @new_user['user']['password'] = 'integration'
  insert_user(@new_user)
  puts 'Creating title DN1000 with postcode PL9 8TB'
  insert_title_with_owners
end
