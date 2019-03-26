class Stockindex::Index
  attr_accessor :url, :name, :price, :change, :previous_close, :ticker
  
  def initialize (name, url)
    @name = name
    @url = url 
  end
  
 def self.price
    @price
 end
 
 def self.change
   @change
 end
 
 def self.previous_close
   @previous_close
 end
 
 def self.ticker
   @ticker
 end
end