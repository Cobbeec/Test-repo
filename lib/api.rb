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
     
def self.get_meal_details(meal) 
    url =  "https://www.themealdb.com/api/json/v1/1/lookup.php?i=#{meal.meal_id}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    data = JSON.parse(response)["meals"][0]
    meal.instructions = data["strInstructions"]
    #binding.pry 

end 

end 