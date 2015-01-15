#!/usr/bin/env ruby

require 'rubygems'
require 'mechanize'

class Hyperiums
  $hypurl = 'http://www.hyperiums.com/servlet/'
  $hypurl2 = 'http://hyp2.hyperiums.com/servlet/'
  
  def initialize(username, password)
    @username=username
    @password=password
    @agent = Mechanize.new { |a|
     a.user_agent_alias = 'Linux Firefox'
    }
    #create the nokogiri
  end
  def login
    #Check that the user is not already logged in
    @agent.get($hypurl + "Login?login="+@username+"&pwd="+@password+"&lang=0")
    @agent.get($hypurl2 + "Login?login="+@username+"&pwd="+@password+"&weblogin=login")
  end
  def home
    puts @agent.get($hypurl2+"Home").content
  end
  def logout
    @agent.get($hypurl2+"Logout")
  end
end