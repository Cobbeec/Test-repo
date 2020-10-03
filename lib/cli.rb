#handles our interactions with the user. 
#It will contain all of the gets and puts to interact 
#control flow of program 

class CLI 

    def start 
        puts ""
        puts "Welcome to my this horrible app"
        puts ""
       puts "Search for a meal by ingredient"
       puts ""
       @ingredient = gets.strip.downcase 
       puts ""
       API.fetch_meals(@ingredient) 
       puts ""
       meals = Meal.all 
       print_meals(meals) 
       puts ""
    end 

    def print_meals(ml)
        puts ""
        puts "Here are your meals with #{@ingredient}"
        puts ""
        ml.each_with_index do | m, i | 
            puts "#{i+1}. #{m.name}"
    end 
      
    end 

end 