class Stockindex::Scraper
 
 def self.scrape_index(url)
   site = Nokogiri::HTML(open(url))
   binding.pry
   price = site.css("#SPX_LastSale1").text
 end
end