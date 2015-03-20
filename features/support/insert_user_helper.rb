require 'uri'
require 'net/http'

def timestamp
  return Time.now.strftime('%Y%m%d%H%M%S%L').to_s
end

def insert_user(new_user)
  uri = URI.parse("#{$DIGITAL_LOGIN_API}")
  #TODO: the localhost page needs to be set to an environmental variable
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
