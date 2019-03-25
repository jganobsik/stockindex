class Stockindex::CLI
  
  def start 
    puts 'Welcome to StockIndex!'
    index 
  end
    
    def index
    puts "Which index would you like to see?"
    puts "1) S&P 2) NASDAQ 3)RUSSELL 4) NASDAQ GLOBAL 5)DOW JONES "
    puts "Please enter a number 1-3"
    input = gets.strip.to_i
    
    case input
    when 1 
     puts "S&P"
     ticker = "SPX"
     url = "https://www.nasdaq.com/aspx/infoquotes.aspx?symbol=SPX&selected=SPX"
     scrape_index(url, ticker)
    when 2 
      puts "NASDAQ"
      ticker = "IXIC"
      url = "https://www.nasdaq.com/aspx/infoquotes.aspx?symbol=IXIC&selected=IXIC"
      scrape_index(url, ticker)
    when 3 
      puts "RUSSELL 2000"
      ticker = "RUT"
      url = "https://www.nasdaq.com/aspx/infoquotes.aspx?symbol=RUT&selected=RUT"
      scrape_index(url, ticker)
      
    when 4
      puts "NASDAQ GLOBAL"
      ticker = "NQGS"
      url = "https://www.nasdaq.com/aspx/infoquotes.aspx?symbol=NQGS&selected=NQGS"
      scrape_index(url, ticker)
      
    when 5   
      puts "DOW JONES"
      ticker = "INDU"
      url = "https://www.nasdaq.com/aspx/infoquotes.aspx?symbol=INDU&selected=INDU"
      scrape_index(url, ticker)
    else 
      puts "Invalid Selection"
      index
    end
  end
  


  def scrape_index(url, ticker)
   index = Stockindex::Scraper.scrape_index(url, ticker)
   puts "today's price: #{index.price}"
   puts "daily change: #{index.change}"
 end
  
end