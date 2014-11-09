require 'rubygems'
require 'nokogiri'

page = Nokogiri::HTML(open("index.html"))

puts page.class # => Nokogiri::HTML::Document

require 'open-uri'