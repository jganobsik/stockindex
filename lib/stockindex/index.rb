class Stockindex::Index
  attr_accessor :url, :name, :price, :change
  
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
end