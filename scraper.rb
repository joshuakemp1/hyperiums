# Need to make sure that you are logged out the browser session before you attempt to run this.

require 'rubygems'
require 'mechanize'

uname = ARGV[0]
pass = ARGV[1]

a = Mechanize.new { |agent|
  agent.user_agent_alias = 'Mac Safari'
}

page = a.get("http://www.hyperiums.com/servlet/Login?login=#{uname}&pwd=#{pass}&lang=0")
page = a.get("http://hyp2.hyperiums.com/servlet/Login?login=#{uname}&pwd=#{pass}&weblogin=login")
page = a.get("http://hyp2.hyperiums.com/servlet/Home")  

puts page.code.to_i
puts page.content