class Stockindex::Index
  attr_accessor :url, :name, :price
  
  def initialize (name, url)
    @name = name
    @url = url 
  end
  
 def self.price
    @price
 end
 
end