class Stockindex::Scraper
 
 def self.scrape_index(url, ticker)
   index = Stockindex::Index.new(url, ticker)
   site = Nokogiri::HTML(open(url))
   index.price = site.css("##{ticker}_LastSale1").text.strip
   return index
  
 end
end