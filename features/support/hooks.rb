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
