# Animal -> super Class
# cow , pig , duck -> sub class
# moo , oink , quack -> instances, each of the instance methods defined in class would be different eg: moo instance under cow class may have grazing methods.
# quack instance under duck class might have swimming method, but all animals do have common methods, such as 4 legs etc


# in ruby you can inherit from only one super class, single inheritance cannot have ,ultiple inheritance
class Car
  attr_accessor :model  # FOR BOTH SETTING AND GETTING A VALUE
  attr_writer :make  # TO ONLE SET THE VALUE , USED IF YOU WANT TO READ A FORMATTED OUTPUT REFER LINE 31
  attr_reader :color #USED ONLY TO READ, MUST BE SET DURING initialize, line 22 and initial value set while creating instance
  # attr_accessor :car_count # case 3 in initialize
  @@car_count = 0  #class variable
  # also keep track of all cars
  @@car_type = []
  # def initialize(color) #case 1
  def self.get_car_count # class reader method
    @@car_count
  end

  def self.get_car_type # class reader method
    @@car_type
  end

  def initialize(model= "Benz", make= "2010",color)
     @model = model
     @make = make
     @color = color
     # Case 3: initialize another instance variable
     @@car_count += 1
     # @car_count++ leads to an error, if any operation performed on attr_methods, they must be defined as a method
     @@car_type << self  # here self refers to that particular object (stores complete car object)
  end
 def get_make
   # instead of just printing out say 2010 , I want to print out the car was manufactured in the year 2010
   puts "#{@model} was manufactured in the year #{@make}"
 end

end

# create and instance
# car1 = Car.new
#########################Step 3: if using attr_reader and initialize
car1 = Car.new("Toyota","red")
# puts car1.model
# car1.make = "2020"
# puts car1.get_make
##################step5 : sub class method does not over ride this
puts car1.color
#
# car2 = Car.new("blue")
# puts car2.model
# puts car2.get_make
# puts car2.color
#
# car3 = Car.new("white")
#
# puts Car.get_car_count
# puts Car.get_car_type.inspect

# sub class inheriting from super class car
class DieselCars < Car
  attr_writer :fuel_type
  # sub class methods
  def get_fuel_type
    puts "fuel type is #{@fuel_type}"
  end
  ##################step 5: subclass overriding
  def color
    # puts "the color of #{@model} is #{@color}"
#######################step 6: access superclass
    # puts "hello" # returns hello, when retrieving color
    super # retrieves, super class method and does not override , this is not so useful yet


    # lets reverse "hello" and super and see what happens
    super
    puts "hello"

    parent_color = super
    puts "hello and parent color is #{parent_color}"
  end

end
#####################step1:
# outlander = Suv.new # run in command line and you will notice an error, given 0, ecpected 1..3, indicating initialize method is expecting arguments
truck = DieselCars.new("ford","green")

# show that sub class instance can use both sub class methods and super class methods
truck.fuel_type = "Diesel"

puts truck.get_fuel_type

puts truck.model

################step5: tetsing subclass overriding
puts truck.color

# puts outlander.make # will not work as this is only a writer
puts truck.get_make
puts truck.color
# puts Suv.car_count cannot access class variable without a class method
puts DieselCars.get_car_count
puts DieselCars.get_car_type.inspect
puts car1.class
puts truck.class
