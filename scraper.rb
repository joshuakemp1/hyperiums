require "net/http"
require "uri"

uname = ARGV[0]
pass = ARGV[1]

uri = URI.parse("http://www.hyperiums.com/servlet/Login?login=#{uname}&lang=0&pwd=#{pass}")

uri2 = URI.parse("http://hyp2.hyperiums.com/servlet/Home")

# Shortcut
#response = Net::HTTP.get_response(uri)

# Will print response.body
#Net::HTTP.get_print(uri)

# Full
#http = Net::HTTP.new(uri.host, uri.port)
#response = http.request(Net::HTTP::Get.new(uri.request_uri))

r = http.get(uri)
cookie = {'Cookie'=>r.to_hash['set-cookie'].collect{|ea|ea[/^.*?;/]}.join}
r = http.get(uri2,cookie)

puts r.code.to_i
