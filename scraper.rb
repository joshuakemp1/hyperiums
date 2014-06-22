require "net/http"
require "uri"

uname = ARGV[0]
pass = ARGV[1]

uri = URI.parse("http://hyp2.hyperiums.com/servlet/Login?login=#{uname}&lang=0&pwd=#{pass}")

# Shortcut
#response = Net::HTTP.get_print(uri)

# Will print response.body
#Net::HTTP.get_print(uri)

# Full
http = Net::HTTP.new(uri.host, uri.port)
response = http.request(Net::HTTP::Get.new(uri.request_uri))

puts response