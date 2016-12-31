require 'nokogiri'
require 'open-uri'

class WodRepo
  def self.wod
    page = Nokogiri::HTML(open('http://crossfitsouthbrooklyn.com/workout-of-the-day/rss.xml'))
    parse_wod_name(page)
  end

  def self.parse_wod_name(page)
    page.css('item title')[0].text.split('|').first.squish
  end
end
