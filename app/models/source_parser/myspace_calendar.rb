require 'rubygems'
require 'hpricot'
require 'open-uri'

doc = Hpricot(open("http://www.myspace.com/valentineslifeblood"))
doc.search("/html/body/table/tr/td[2]/table/tr/td[3]/table[4]/tr[2]/td/table/tr").each do |row|
#  row.search("td[1]/table/tr/td[1]/font").inner_html
  row.search("td[1]/table/tr").each do |datetime|
    puts datetime.search("td[1]/font").inner_html
    puts datetime.search("td[1]/font").inner_html
  end
end

