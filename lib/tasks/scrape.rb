require 'open-uri'
require 'nokogiri'
require 'byebug'

def scrape(keyword)
  url = URI.encode("https://www.google.com/search?q=#{keyword}")
  doc = Nokogiri::HTML(open(url))

  topic = doc.css("#rhs_block div div div div div div:nth-child(2)")

  scrape = []
  for i in 6..11 do
    scrape << topic[i].values.last
  end
  
  return scrape
end
