#handles our interactions with the user. 
#It will contain all of the gets and puts to interact 
#control flow of program 

class CLI 

    def start 
        puts ""
        puts "Welcome to Meal Finder!"
        puts ""
       puts "Search for a meal by ingredient"
       puts ""
       @ingredient = gets.strip.downcase 
       puts ""
       API.fetch_meals(@ingredient) 
       puts ""
       meals = Meal.all 
       print_meals(meals) 
      prompt 
       inp = gets.strip.downcase 
       while inp != 'exit' do 
        if inp == 'list'
            binding.pry 
            print_drinks(Ingredient.find_by_ingredient(@ingredient).drinks)
        else 
        meal = Ingredient.find_by_ingredient(@ingredient).meals[inp.to_i - 1]
        API.get_meal_details(meal)
        print_meal(meal)  
    end 
    prompt 
    inp = gets.strip.downcase  
end 
    puts "Goodbye!"
end 

    def print_meals(ml)
        puts ""
        puts "Here are your meals with #{@ingredient}"
        puts ""
        ml.each_with_index do | m, i | 
            puts "#{i+1}. #{m.name}"
    end 
      
    end 

def print_meal(meal) 
    puts ""
    puts "#{meal.name} Recipe:"
    puts "---------------"
    puts "#{meal.instructions}"
    puts "---------------"
    puts ""

end 

def prompt 
    puts ""
    puts "Type a number listed to se e more details."
    puts "OR type 'ingredient' to search for a new ingredient"
    puts "OR type 'list' to see the list again"
    puts "OR type 'exit' to exit"
    puts ""
end 

end 