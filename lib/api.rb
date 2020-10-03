#will handle all of the API requests 
#anything with a JSON response 


class API  

def self.fetch_meals(ingredient)
    url = "https://www.themealdb.com/api/json/v1/1/filter.php?i=#{ingredient}"
    uri = URI(url) 
    response = Net::HTTP.get(uri)
    meals = JSON.parse(response)["meals"]
    meals.each do |m|
    Meal.new(name: m["strMeal"], meal_id: m["idMeal"])
    end 
      
     

end 

end 