Before do
  $tables_created ||= false
  return $tables_created if $tables_created
  create_register_tables
end

Before do
  delete_all_titles
end

Before('@existing_user') do
  @new_user = Hash.new()
  @new_user['user'] = Hash.new()
  @new_user['user']['user_id'] = 'username'+ timestamp
  @new_user['user']['password'] = 'dummypassword'
  response = insert_user(@new_user)
end
