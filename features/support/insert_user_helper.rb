require 'uri'
require 'net/http'

def timestamp
  return Time.now.strftime('%Y%m%d%H%M%S%L').to_s
end

def insert_user(new_user)
  uri = URI.parse("#{$DIGITAL_LOGIN_API}")
  http = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Post.new('/admin/user',  initheader = {'Content-Type' =>'application/json'})
  request.basic_auth $http_auth_name, $http_auth_password
  request.body = new_user.to_json
  response = http.request(request)
  if (response.code != '200') then
    raise "user was not created: " + response.body
  end
  return response.body
end

def delete_user(user_to_delete)
  uri = URI.parse("#{$DIGITAL_LOGIN_API}")
  http = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Delete.new("/admin/user/#{user_to_delete}",  initheader = {'Content-Type' =>'application/json'})
  request.basic_auth $http_auth_name, $http_auth_password
  request.body = user_to_delete.to_json
  response = http.request(request)
  if (response.code != '200') then
    raise "user was not deleted"
  end
  return response.body
end

def update_user(user_password_to_update, user_id_to_update)
  uri = URI.parse("#{$DIGITAL_LOGIN_API}")
  http = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Post.new("/admin/user/#{user_id_to_update}/update",  initheader = {'Content-Type' =>'application/json'})
  request.basic_auth $http_auth_name, $http_auth_password
  request.body = user_password_to_update.to_json
  response = http.request(request)
  if (response.code != '200') then
    raise "user was not updated: " + response.body
  end
  return response.body
end
