#This is where will create objects! 
#keeps track of charities and turn our responses into objects 

class Meal  
    attr_accessor :name, :meal_id, :ingredient , :instructions , :ingredients , :measures , :category
    @@all = []
    
   def initialize(name:, meal_id:, ingredient:)
     @name = name 
     @meal_id = meal_id  
     @ingredients = []
     @measures = []
     @ingredient = ingredient 
     @@all << self 
    end 

    def self.all 
        @@all 
    end 

    def self.find(meal)
        @@all.select {|m| m == meal}
     end 

end  

#you had an m. before ingredient before 