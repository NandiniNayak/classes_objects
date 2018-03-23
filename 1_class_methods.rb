# revision
# 1. create a class, instance (instance variable) getters and setters, initialize(describe 3 cases and passing arguments from Class.new())
# class methods and self
# start with a challenge of displaying car count

# "so far we have discussed instance methods and how we can call these methods only by
# creating an instance
#
# few methods could be directly called on class itself which is a class method.
#
# eg: new is a class method (used to create instance)
#
# we want class to do something, irrespective of wether there is a class or not
#
# similar to class but use, self
#
# def self.method_name
#
# end , done above initialize"
#
# "methods created inside class, which calls itself and does not need an instance to call it"

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
    # def initialize(model: :Benz ,make= "2010" , color)  #why doesn't this work??? compare with  line 90
    # note: initialize method does not accept symbols
    "this method is run each time an instance is created serving two purpose"
    "1. since color is not set -> and only attr_reader is used, set the color while creating instance Car.new(red)"
    "2. Also have some default values set, just incase not set during instance creation"
    "3. class variable can be updated when each instance created, in this case keeps track of number of cars with each instance"

     @model = model
     @make = make
     @color = color

     # Case 3: initialize another instance variable
     @@car_count += 1
     # @car_count++ leads to an error, if any operation performed on attr_methods, they must be defined as a method
     @@car_type << self  # here self refers to that particular object (stores complete car object)

  end
  # def set_model(model) #attribute
  #   # @model = "BMW"
  #   @model = model
  # end
  #
  # def get_model
  #   @model
  # end
 def get_make
   # instead of just printing out say 2010 , I want to print out the car was manufactured in the year 2010
   puts "#{@model} was manufactured in the year #{@make}"
 end

end

# create and instance
# car1 = Car.new
#########################Step 3: if using attr_reader and initialize
car1 = Car.new("Toyota","red")
# car1 = Car.new(model: :toyota,"red")
##########################step 3: comment line 69 and set model during call
# use a setter method to set  value
# car1.set_model = "Toyota"
# puts car1.get_model
################## step 2: if using attr_accessor
# car1.model= "Toyota"   # setting default value will prevent errors if setting model is missed : explained in line 24
puts car1.model
car1.make = "2020" # setting default value will prevent errors if setting make is missed : explained in line 24
puts car1.get_make
puts car1.color  #set by initialize method
# puts car1.get_car_count
#####################################step3 : case 2: Notice how car2, prints out 2010 and benz although its not set due to initialize line 24
car2 = Car.new("blue")
# car2.set_model = "BMW"
# car2.model = "BMW"
puts car2.model
puts car2.get_make
puts car2.color
# puts car2.get_car_count

# the setter and getter method can be replaced with attr_accessor,attr_reader or attr_writer
"OPL's
1. why line 26 doesnot work?? compare with line 90
2. Why is the car count reset to 0 or how can the car count be incremented for each instance??"

car3 = Car.new("white")

puts Car.get_car_count
puts Car.get_car_type.inspect

#
# def sum(num1: 2 , num2: 3)
#   sum = num1 + num2
#   puts sum
# end
#
# sum(num1: 5)
