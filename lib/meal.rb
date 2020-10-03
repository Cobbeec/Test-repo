#This is where will create objects! 
#keeps track of charities and turn our responses into objects 

class Meal  
    attr_accessor :name , :meal_id 
    @@all = []
    
   def initialize(name:, meal_id:)
     @name = name 
     @meal_id = meal_id  
     @@all << self 
    end 

    def self.all 
        @@all 
    end 


end  