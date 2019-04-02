class Stockindex::Scraper
 
 def self.scrape_index(url, ticker)
   index = Stockindex::Index.new(url, ticker)
   site = Nokogiri::HTML(open(url))
   index.price = site.css("##{ticker}_LastSale1").text.strip
   index.change = site.css("##{ticker}_Per2").text.strip
   index.previous_close = site.css("##{ticker}_previousclose").text.strip
   index.ticker = ticker
   return index
 end

 def self.update_pricing(stock)
  url = stock.url
  ticker = stock.ticker
  site = Nokogiri::HTML(open(url))
  stock.price = site.css("##{ticker}_LastSale1").text.strip
  stock.change = site.css("##{ticker}_Per2").text.strip
  stock.previous_close = site.css("##{ticker}_previousclose").text.strip
 end

end