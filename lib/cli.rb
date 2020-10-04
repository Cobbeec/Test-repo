#handles our interactions with the user. 
#It will contain all of the gets and puts to interact 
#control flow of program 

class CLI 

    def start 
        puts ""
        puts "Welcome to Meal Finder!"
        prompt_ingredient 
        prompt 
       inp = gets.strip.downcase 
       while inp != 'exit' do 
        if inp == 'list' 
            print_meals(Ingredient.find_by_ingredient(@ingredient).meals)
        elsif inp.to_i > 0 && inp.to_i <= Ingredient.find_by_ingredient(@ingredient).meals.length
        meal = Ingredient.find_by_ingredient(@ingredient).meals[inp.to_i - 1]
       if !meal.instructions  
        API.get_meal_details(meal)
        print_meal(meal)  
       else 
        print_meal(Meal.find(meal)[0])
       end 
    elsif inp == 'ingredient'
        prompt_ingredient
        else 
            puts "Please try again"
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
    #binding.pry 
    meal.ingredients.each_with_index do | ing, index | 
    puts "#{ing} - #{meal.measures[index]}"
end 
          puts "-------------------"
          puts "#{meal.instructions}"
          puts ""
end 

def prompt 
    puts ""
    puts "Type a number listed to see more details."
    puts "OR type 'ingredient' to search for a new ingredient"
    puts "OR type 'list' to see the list again"
    puts "OR type 'exit' to exit"
    puts ""
end 

def prompt_ingredient 
    puts ""
    puts "Search for a meal by ingredient"
    puts ""
    @ingredient = gets.strip.downcase 
    puts ""
    API.fetch_meals(@ingredient) 
    puts ""
    meals = Ingredient.find_by_ingredient(@ingredient).meals #prints meals belonging to ingredient you just found
    print_meals(meals) 
end 



#def prompt_picture 
#end 


end 