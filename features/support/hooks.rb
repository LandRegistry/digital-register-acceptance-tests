Before do
  $tables_created ||= false
  return $tables_created if $tables_created
  create_register_tables
end

Before do
  delete_all_titles
end
