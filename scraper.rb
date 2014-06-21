require "mechanize"
require "nokogiri"

url = ARGV[0]
fp = File.new("wikilinks.txt", "w")

agent = Mechanize.new { |agent| agent.user_agent_alias = "Mac Safari" }

html = agent.get(url).body

html_doc = Nokogiri::HTML(html)

fp.write("References\n\n")

list = html_doc.xpath("//ol[@class='references']")
list.each { |i| fp.write(i.text + "\n") }

fp.write("Further Reading\n\n")

list = html_doc.xpath("//span[@class='citation']")
list.each { |i| fp.write(i.text + "\n") }