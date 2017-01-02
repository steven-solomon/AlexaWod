require 'nokogiri'
require 'open-uri'

class WodRepo
  def self.wod(date)
    page = Nokogiri::XML(open('http://crossfitsouthbrooklyn.com/workout-of-the-day/rss.xml'))
    parse_wod_name(page, date)
  end

  def self.parse_wod_name(page, date)
    links = page.css("item link[contains('#{date}')]")
    item = links.first.parent
    item.css('title').text.split('|').first.squish
  end
end
