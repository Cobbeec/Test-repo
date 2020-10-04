class Category 
    attr_accessor :name, :meals 
    @@all = []

    def initialize(name) 
        @name = name 
        @meals = [] 
        @@all << self 

    end 

    def self.all 
        @@all 
    end 

    def self.find_by_category(category)
        @@all.find{ |c| c.name == category}
    end 

end 