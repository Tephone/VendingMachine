require "thor"
require "pry"

class Drink
  attr_reader :name, :price
  def initialize(name, price)
    @name = name
    @price = price
  end

  def self.water
    self.new( 'water',100 )
  end

  def self.cola
    self.new( 'cola', 120 )
  end

  def self.redbull
    self.new( 'redbull', 200)
  end
end

class VendingMachine
  attr_reader :total_money, :sale_amount, :stock
  MONEY = [10, 50, 100, 500, 1000].freeze
  def initialize
    @total_money = 0
    @sale_amount = 0
    @stock = {cola: 5, water: 5, redbull: 5}
  end

  def insert(money)   
    if MONEY.include?(money)
      @total_money += money 
    end
  end

  def buy(drink)
    @total_money -= drink.price
    @stock[drink.name.to_sym] -= 1
    @sale_amount += drink.price
  end    

  def return_money
    @total_money = 0    
  end 

  def can_you_buy?(drink)
    stocks = @stock[drink.name.to_sym]
    if @total_money >= 120 && stocks > 0 && drink.name == 'cola'
      "cola:#{stocks}"
    elsif @total_money >= 100 && stocks > 0 && drink.name == 'water'
      "water:#{stocks}"
    elsif @total_money >= 200 && stocks > 0 && drink.name == 'redbull'
      "redbull:#{stocks}"
    else
      "#{drink.name}:買えません"
    end
  end

  def can_you_buy_list
    puts (can_you_buy?(Drink.cola))
    puts (can_you_buy?(Drink.water))
    puts (can_you_buy?(Drink.redbull))
  end

  def store(drink, num)
    @stock[drink.name.to_sym] += num 
  end
end
