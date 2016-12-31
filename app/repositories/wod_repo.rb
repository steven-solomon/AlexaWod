require 'nokogiri'
require 'open-uri'

class WodRepo
  def self.wod
    page = Nokogiri::HTML(open('http://crossfitsouthbrooklyn.com/workout-of-the-day/rss.xml'))
    string_from_html(page)
  end

  def self.string_from_html(page)
    page.css('item title')[0].text.split('|').first.squish
  end
end
