#This is where will create objects! 
#keeps track of charities and turn our responses into objects 

class Meal  
    attr_accessor :name, :meal_id, :ingredient
    @@all = []
    
   def initialize(name:, meal_id:, ingredient:)
     @name = name 
     @meal_id = meal_id  
     @ingredient = ingredient 
     @@all << self 
    end 

    def self.all 
        @@all 
    end 

    def self.find_by_ingredient(ingredient)
        @@all.select{|m| m.ingredient == ingredient }
    end 

end  