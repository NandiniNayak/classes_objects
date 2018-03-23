# block is a chunk of code that you pass to the method as an argument

def do_something
  yield  # note yield returns the value passed in the block
end

do_something{puts "Hello world"}

# when yield code is encountered, we jump into the block
def do_something
  puts "before the block"
  yield
  puts "after the block"
end

do_something{puts "Inside the block"}
# if a method is expecting a block and you don't pass one error is encountered

# def do_something
#   yield
# end
#
# do_something

# you can conditionally yield, with block_given?

def do_something
  yield if block_given?
end

do_something

def total(num1,num2)
  sum = num1+num2
  yield(sum)
end


total(4,4) do |addition_total|
  puts "Addition total is #{addition_total}"
end
