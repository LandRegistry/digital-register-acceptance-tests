def process_titles_in_directory(data_directory)
  ENV["REGISTER_FILES_PATH"] = "data/#{data_directory}"
  result = `sh consume_register_entries.sh`
  puts result
  #TODO: better reporting here, error code is not reliable
  if $?.to_i != 0
    puts "Error creating title"
  end
end

def insert_title_with_multiple_index_polygons
  process_titles_in_directory("multiple-index-polygons")
  {
    :title_number => "AGL1005",
  }
end

def insert_title_non_private_individual_owner
  process_titles_in_directory("non-private-individual-owner")
  {
    :title_number => "AGL1000",
    :last_changed => "02 July 1996 at 00:59:59",
    :owners => ["HEATHER POOLE PLC"],
    :postcode => "PL9 7FN",
    :town => "Plymouth",
    :house_number => 21,
    :street_name => "Murhill Lane"
  }
end

def insert_title_private_individual_owner
  process_titles_in_directory("private-individual-owner")
  {
    :title_number => "AGL1001"
  }
end

def insert_title_charity_non_private_individual_owner
  process_titles_in_directory("charity-non-private-individual-owner")
  {
    :title_number => "AGL1003",
    :last_changed => "28 August 2003 at 14:45:50",
    :owners => ["HEATHER JONES","JOHN JONES","HEATHER SMITH"],
    :postcode => "PL9 7FN",
    :town => "Plymouth",
    :house_number => 21,
    :street_name => "Murhill Lane"
  }
end

def insert_title_charity_private_individual_owner
  process_titles_in_directory("charity-private-individual-owner")
  {
    :title_number => "AGL1002"
  }
end
