require 'nokogiri'
require 'open-uri'

class WodRepo
  def self.wod
    page = Nokogiri::HTML(open('http://www.crossfitsouthbrooklyn.com'))
    string_from_html(page)
  end

  def self.string_from_html(page)
    page.css('h2.title')[0].text.squish
  end
end
