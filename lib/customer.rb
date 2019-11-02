class Customer
  
	attr_accessor :name, :age

  	@@all = []

	def initialize(name, age)
		@name = name
		@age = age
		@@all << self
	end

	def self.all
		@@all		
	end

	def new_meal(waiter, total, tip=0)
		Meal.new(waiter, self, total, tip)
	end

	def meals #returns meals array, with waiter, total, and tip data
		Meal.all.select do |meal|
			meal.customer == self
		end
	end

	def waiters #returns waiters array
		meals.map do |meal|
			meal.waiter
		end
	end

end