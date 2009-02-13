class SourceParser
  class MyspaceCal < SourceParser::Base
    # Returns a set of AbstractEvent objects.
    #
    # Options:
    # * :url => URL String to read events from.
    def self.to_abstract_events(opts = {})
      doc = Hpricot(open("http://www.myspace.com/valentineslifeblood"))
      doc.search("/html/body/table/tr/td[2]/table/tr/td[3]/table[4]/tr[2]/td/table/tr").map do |row|
        returning(AbstractEvent.new) do |event|
#  row.search("td[1]/table/tr/td[1]/font").inner_html
          dt = row.at("td[1]/table/tr")
          date = dt.at("td[1]/font").inner_html
          time = dt.at("td[2]/font").inner_html + "M" # Make it say "PM" at the end.
	  title = row.at("td[2]/font/a").inner_html
          event.start_time  = Time.parse(date + " " + time)
          event.end_time    = event.start_time + (3 * 60 * 60)  # +3 hours (in seconds)
	  # Shows there usually go for three hours, till midnight-ish
          event.title       = title
          #event.description = component.description
          event.url         = "http://myspace.com/" + "valentineslifeblood"
	end
      end
    end
  end
end
