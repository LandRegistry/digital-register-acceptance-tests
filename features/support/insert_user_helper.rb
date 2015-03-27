require 'uri'
require 'net/http'

def timestamp
  Time.now.strftime('%Y%m%d%H%M%S%L').to_s
end

def insert_user(new_user)
  uri = URI.parse("#{$DIGITAL_LOGIN_API}")
  http = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Post.new('/admin/user',
                                'Content-Type' => 'application/json'
  )
  request.body = new_user.to_json
  response = http.request(request)
  handle_response(response, 'created')
end

def delete_user(user_to_delete)
  uri = URI.parse("#{$DIGITAL_LOGIN_API}")
  http = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Delete.new("/admin/user/#{user_to_delete}",
                                  'Content-Type' => 'application/json'
  )
  request.body = user_to_delete.to_json
  response = http.request(request)
  handle_response(response, 'deleted')
end

def update_user(user_password_to_update, user_id_to_update)
  uri = URI.parse("#{$DIGITAL_LOGIN_API}")
  http = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Post.new("/admin/user/#{user_id_to_update}/update",
                                'Content-Type' => 'application/json'
  )
  request.body = user_password_to_update.to_json
  response = http.request(request)
  handle_response(response, 'updated')
end

def handle_response(response, action)
  if (response.code != '200')
    fail "User was not #{action}"
  else
    puts "User has been #{action}"
  end
end
