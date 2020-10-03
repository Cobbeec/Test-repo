#will handle all of the API requests 
#anything with a JSON response 


class API  

def self.fetch_meals(ingredient)
    url = "https://www.themealdb.com/api/json/v1/1/filter.php?i=#{ingredient}"
    uri = URI(url) 
    response = Net::HTTP.get(uri)
    meals = JSON.parse(response)["meals"]
    meals.each do |m|
    Meal.new(name: m["strMeal"], meal_id: m["idMeal"], ingredient: ingredient)
    end 
     
end 
     
def self.get_meal_details(meal) 
    url = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=#{meal.meal_id}"
    binding.pry 
    uri = URI(url)  
    response = Net::HTTP.get(uri)
    meal = JSON.parse(response)["meals"][0]
end 

end 