class Stockindex::CLI
  
  def start 
    puts 'Welcome to StockIndex!'
    puts "Which index would you like to see?"
    puts "1) S&P 2) NASDAQ 3)DOW JONES"
    puts "Please enter a number 1-3"
    input = gets.strip.to_i
    
    case input
    when 1 
      puts "S&P"
     #url = "https://finance.yahoo.com/quote/%5EGSPC?p=^GSPC"
     url = "https://www.nasdaq.com/aspx/infoquotes.aspx?symbol=SPX&selected=SPX"
  
      Stockindex::Scraper.scrape_index(url)
    when 2 
      puts "NASDAQ"
    when 3 
      puts "DOW JONES"
    else 
      puts "Invalid Selection"
    end
  end
end