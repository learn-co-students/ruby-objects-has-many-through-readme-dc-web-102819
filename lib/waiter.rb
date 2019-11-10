class Waiter

    @@all = []
    attr_accessor :name, :experience

    def initialize(name, experience)
        @name = name
        @experience = experience

        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select {|meal| meal.waiter == self}
    end

    def best_tipper
        max_tip = 0
        current_best = Meal.all[0]
        Meal.all.each do |meal| 
            if meal.waiter == self && meal.tip > max_tip
                max_tip = meal.tip
                current_best = meal
            end
        end

        current_best.customer
    end

end