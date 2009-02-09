class SourceParser
  class MyspaceCal < Base
    require 'rubygems'
    require 'hpricot'
    require 'open-uri'

    # Returns a set of AbstractEvent objects.
    #
    # Options:
    # * :url => URL String to read events from.
    def self.to_abstract_events(opts = {})

    doc = Hpricot(open("http://www.myspace.com/valentineslifeblood"))
    doc.search("/html/body/table/tr/td[2]/table/tr/td[3]/table[4]/tr[2]/td/table/tr").map do |row|
#  row.search("td[1]/table/tr/td[1]/font").inner_html
      row.search("td[1]/table/tr").each do |datetime|
        puts datetime.search("td[1]/font").inner_html
        puts datetime.search("td[2]/font").inner_html
        event             = AbstractEvent.new
        event.start_time  = component.dtstart
        event.title       = component.summary
        event.description = component.description
        event.end_time    = component.dtend
        event.url         = component.url
	return event
      end
    end
  end
end
