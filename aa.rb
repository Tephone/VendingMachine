require "thor"
require "pry"

# stock1 = {cola:5, water:5, redbull: 5}

# puts stock1[:cola]
# #puts stock1[cola:]

# stock2 = {"cola" => 5, "water" =>5, "redbull" => 5}
# puts stock2["cola"]
#puts stock2[cola]
 
# class Aisatu
#     attr_accessor :china

#     # @china = "你好"
#     def initialize
#         @japan = "こんにちは"
#         @china = "你好"
#     end

#     def hello
#         puts "hello"
#     end

#     # def china
#     #     @china = "你好"
#     # end
# end

# @aisatu = Aisatu.new
# @aisatu.hello

# puts @aisatu.china
stock = {cola:5, water:5, redbull: 5}


def buy(drink)
    stock = {cola:5, water:5, redbull: 5}
    a = stock[drink.to_sym]
    stock[drink.to_sym]  -= 1
    puts stock[drink.to_sym]
end    

buy("cola")