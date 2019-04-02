
class Stockindex::Index
  attr_accessor :url, :name, :price, :change, :previous_close, :ticker, :history

  @@all = []

  def initialize (url, ticker)
    @url = url
    @ticker = ticker
    @history = []
    @@all << self
  end
  
def self.all
  @@all
end
end