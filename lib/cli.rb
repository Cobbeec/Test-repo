#handles our interactions with the user. 
#It will contain all of the gets and puts to interact 
#control flow of program 

class CLI 
    def start 
        puts ""
        puts "Welcome to My Recipe App!"
        puts "Please enter 'ingredient' to search by ingredient"
        puts "Or enter 'category' to search by category"
        puts "OR enter 'exit' to exit"  
        inp = gets.strip.downcase
        while inp != 'exit' do 
            if inp == 'ingredient'
                prompt_ingredient 
                @ingredient = gets.strip.downcase
                 puts ""
                 if !Ingredient.find_by_ingredient(@ingredient) 
                    API.fetch_meals(@ingredient)
                 end 
                puts ""
                meals = Ingredient.find_by_ingredient(@ingredient).meals 
                print_meals(meals)
                ingredient_list 
            elsif inp =='category'
                prompt_category 
                @category = gets.strip.downcase 
                puts ""
                API.fetch_meals_category(@category)
                puts ""
                meals = Category.find_by_category(@category).meals
                print_meals(meals)    
                category_list 
             else 
                 puts "I do not understand - please try again."
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
    contrastActiveBorder
    meal.ingredients.each_with_index do | ing, index | 
    puts "#{ing} - #{meal.measures[index]}"
end 
end 

def prompt 
    puts ""
    puts ""
    puts "OR type 'ingredient' to search for a new ingredient"
    puts "OR type 'category' to search by category."
    puts "OR type 'exit' to exit"
    puts ""
end 

def prompt_ingredient
    puts ""
    puts "Search for meals by entering an ingredient"
    puts ""
    
end 

 def prompt_category 
     puts ""
     puts "Welcome to search for a meal by category! Enter a category."
     puts ""
     
 end 

 def category_list 
    puts "Please select a number"
    inp = gets.strip.downcase 
    until inp.to_i > 0 && inp.to_i <= Category.find_by_category(@category).meals.length
     puts "Invalid input. Please try again"
     inp = gets.strip.downcase
    end 
    meal = Category.find_by_category(@category).meals[inp.to_i - 1]
     API.get_meal_details(meal) if !meal.instructions 
     print_meal(meal)
end

def ingredient_list 
    puts "Please select a number"
    inp = gets.strip.downcase 
    until inp.to_i > 0 && inp.to_i <= Ingredient.find_by_ingredient(@ingredient).meals.length
        puts "Invalid input. Please try again"
        inp = gets.strip.downcase
       end 
       meal = Ingredient.find_by_ingredient(@ingredient).meals[inp.to_i - 1]
        API.get_meal_details(meal) if !meal.instructions #check me 
        print_meal(meal) 
        
         print_meal(Meal.find(meal)[0])  
      end
    end 
