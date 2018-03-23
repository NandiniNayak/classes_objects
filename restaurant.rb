require 'terminal-table'
exit = false

class Customer
  def initialize(food,orderNo,bill)
    @food= food
    @orderNo = orderNo
    @bill = 0
  end
  attr_accessor :food,:orderNo,:bill

  def menu
    # @menu = Hash.new
    @menu = {"1.Big Mac" => 8 , "2.Cheese Burger" => 6 , "3.Ham Burger" => 5, "4.MC Chicken" => 6}
    @menuList = {1 => 8 , 2 => 6 , 3 => 5 , 4 => 6}
    rows = []
    table = []

    @menu.each do |food , price|
      rows << [food,price]
      table = Terminal::Table.new :title => "McDonald's", :headings => ['Food', 'Price ($)'], :rows => rows
    end
    puts "\e[33m Welcome to McDonald's, Happy to serve you. Kindly place your order by entering the number against the food item\e[0m"
    puts "\e[32m Enter 5 to place your order\e[0m"
    puts table
  end

  def orderNumber
    puts "How many would you like ?"
    @orderNumber = gets.chomp.to_i
  end

  def priceForTheOrder(itemNumber)
    @itemNumber = itemNumber
    @priceForTheOrder = @menuList[@itemNumber]

  end

  def orderbill
    @bill =  @bill + (@orderNumber.to_i * @priceForTheOrder.to_i)
  end

  def placeOrder(command)
    orderNumber
    priceForTheOrder(command)
    orderbill
  end

end

customer1 = Customer.new("","","")

until exit do
  customer1.menu
  command = gets.chomp.to_i
  case command
  when 1,2,3,4
    customer1.placeOrder(command)

  when 5
    puts "We are delighted to have you at McDonald's - Your order is successfully placed -
    \e[33m Total Amount - $#{customer1.bill}\e[0m"
    exit = true

  else
    puts "Invalid Key Try again"
  end
end
