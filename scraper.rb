require "net/http"
require "uri"

uname = ARGV[0]
pass = ARGV[1]

uri = URI.parse("http://hyp2.hyperiums.com/servlet/Login?login=#{uname}&lang=0&pwd=#{pass}")

# Shortcut
#response = Net::HTTP.get_response(uri)

# Will print response.body
#Net::HTTP.get_print(uri)

# Full
#http = Net::HTTP.new(uri.host, uri.port)
#response = http.request(Net::HTTP::Get.new(uri.request_uri))

response = Net::HTTP.get_response(uri)

puts response.code.to_i

puts response.body