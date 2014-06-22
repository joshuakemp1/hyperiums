require "net/http"
require "uri"

uname = ARGV[0]
pass = ARGV[1]

uri = URI.parse("http://www.hyperiums.com/servlet/Login?login=#{uname}&lang=0&pwd=#{pass}")

# Shortcut
response = Net::HTTP.get_print(uri)

puts response

# Will print response.body
#Net::HTTP.get_print(uri)

# Full
#http = Net::HTTP.new(uri.host, uri.port)
#response = http.request(Net::HTTP::Get.new(uri.request_uri))