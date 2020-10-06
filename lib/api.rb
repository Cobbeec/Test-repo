#will handle all of the API requests 
#anything with a JSON response 


class API  

def self.fetch_meals(ingredient)
    url = "https://www.themealdb.com/api/json/v1/1/filter.php?i=#{ingredient}"
    uri = URI(url) 
    response = Net::HTTP.get(uri)
    meals = JSON.parse(response)["meals"]
    new_ingredient = Ingredient.new(ingredient) 
    meals.each do |m| 
    new_meal = Meal.new(name: m["strMeal"], meal_id: m["idMeal"], ingredient: ingredient)
    new_ingredient.meals << new_meal 
    end 
    #binding.pry 
end 

def self.fetch_meals_category(category)
     url = "https://www.themealdb.com/api/json/v1/1/filter.php?c=#{category}"
      uri = URI(url) 
       response = Net::HTTP.get(uri)
       meals = JSON.parse(response)["meals"]
    #    binding.pry 
       new_category = Category.new(category) 
        meals.each do |m| 
        new_meal = Meal.new(name: m["strMeal"] , meal_id: m["idMeal"], category: category)
        new_category.meals << new_meal 
          end 
#          binding.pry 
  end 

     
def self.get_meal_details(meal) 
    url =  "https://www.themealdb.com/api/json/v1/1/lookup.php?i=#{meal.meal_id}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    data = JSON.parse(response)["meals"][0]
    meal.instructions = data["strInstructions"]
    meal.category = data[ "strCategory"]
    data.keys.each do |k|
        meal.ingredients << data[k] if (k.include?("Ingredient")) && data[k] 
        meal.measures << data[k] if (k.include?("Measure")) && data[k] 
    end 
    #binding.pry 

end 

end 