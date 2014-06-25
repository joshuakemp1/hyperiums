require 'httpclient'

uname = ARGV[0]
pass = ARGV[1]

clnt = HTTPClient.new
clnt.set_cookie_store('./cookie.dat')

if clnt.cookie_manager.check_expired_cookies
  #Process the 3 part login to gather cookies.
  body = { 'login' => uname, 'pwd' => pass }
  puts clnt.post('http://www.hyperiums.com/servlet/Login', body)
  
  body = { 'login' => uname, 'pwd' => pass, 'weblogin'=>'Login'}
  puts clnt.post('http://hyp2.hyperiums.com/servlet/Login', body)
  
  body = { 'fromlogin'=>''}
  puts clnt.post('http://hyp2.hyperiums.com/servlet/Home', body).content
else
  #If the cookies are still valid, request the home page.
  puts clnt.get_content('http://hyp2.hyperiums.com/servlet/Home')
end

clnt.save_cookie_store