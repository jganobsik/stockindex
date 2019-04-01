class Stockindex::CLI
  
  
  def start 
    puts 'Welcome to StockIndex!'
    #start program
    index 
  end
    
    def index
      index_hash = {"SPX" => "https://www.nasdaq.com/aspx/infoquotes.aspx?symbol=SPX&selected=SPX", "IXIC" => "https://www.nasdaq.com/aspx/infoquotes.aspx?symbol=IXIC&selected=IXIC",  "RUT" => "https://www.nasdaq.com/aspx/infoquotes.aspx?symbol=RUT&selected=RUT",  "NQGS" => "https://www.nasdaq.com/aspx/infoquotes.aspx?symbol=NQGS&selected=NQGS",  "INDU" => "https://www.nasdaq.com/aspx/infoquotes.aspx?symbol=INDU&selected=INDU"}
      #lists options and asks user for input 
    puts "Which index would you like to see?"
    puts "1) S&P 2) NASDAQ 3)RUSSELL 4) NASDAQ GLOBAL 5)DOW JONES 6) All Indices 7) Individual Stock"
    puts "Please enter a number 1-7"
    input = gets.strip.to_i
    
    case input
      #switch statement to scrape chosen index
    when 1 
     puts "S&P"
     ticker = "SPX"
     url = "https://www.nasdaq.com/aspx/infoquotes.aspx?symbol=SPX&selected=SPX"
     scrape_index(url, ticker)
     exit_prompt
    when 2 
      puts "NASDAQ"
      ticker = "IXIC"
      url = "https://www.nasdaq.com/aspx/infoquotes.aspx?symbol=IXIC&selected=IXIC"
      scrape_index(url, ticker)
      exit_prompt
    when 3 
      puts "RUSSELL 2000"
      ticker = "RUT"
      url = "https://www.nasdaq.com/aspx/infoquotes.aspx?symbol=RUT&selected=RUT"
      scrape_index(url, ticker)
      exit_prompt
    when 4
      puts "NASDAQ GLOBAL"
      ticker = "NQGS"
      url = "https://www.nasdaq.com/aspx/infoquotes.aspx?symbol=NQGS&selected=NQGS"
      scrape_index(url, ticker)
      exit_prompt
    when 5   
      puts "DOW JONES"
      ticker = "INDU"
      url = "https://www.nasdaq.com/aspx/infoquotes.aspx?symbol=INDU&selected=INDU"
      scrape_index(url, ticker)
      exit_prompt
    when 6
      index_hash.each {|ticker, url| scrape_index(url, ticker)}
      exit_prompt
    when 7
      puts "please enter a ticker symbol"
      ticker = gets.strip.upcase
      url = "https://www.nasdaq.com/aspx/infoquotes.aspx?symbol=#{ticker}&selected=#{ticker}"
      scrape_index(url, ticker)
      exit_prompt

    else 
      puts "Invalid Selection"
      index
    end
  end
  


  def scrape_index(url, ticker)
      #instantializes scraper class to scrape index page and display price and change
      #color changes based on gain/loss via Paint gem
   index = Stockindex::Scraper.scrape_index(url, ticker)
   if valid_ticker?(ticker)
   puts "#{index.ticker}"
   puts "today's price: #{index.price}"

   #determine gain/loss by comparing to yesterday's close
    if index.previous_close >=  index.price
       puts Paint["#{index.ticker} is down #{index.change}", :red]
    else 
      puts Paint["#{index.ticker} is up #{index.change}", :green]
    end
  else puts Paint["Please enter a valid ticker", :yellow]
  end
 end
  
  def exit_prompt
    #asks user whether they wish to continue, sends user back to index choices or displays exit message
    puts "Would you like to view another index?"
    puts "type yes or no"
    input = gets.strip.downcase
    
    if input == "yes"
      index
    elsif input == "no"
      puts "Thanks for using StockIndex!"
    else 
     puts "Invalid Selection"
      exit_prompt
    end
  end

  def valid_ticker?(ticker)
    url = "https://www.nasdaq.com/aspx/infoquotes.aspx?symbol=#{ticker}&selected=#{ticker}"
    stock = Stockindex::Scraper.scrape_index(url, ticker)
    if stock.price == ''
      return false
    else
      return true
    end

  end

      
end