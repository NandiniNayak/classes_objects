# block of code executed each time during iteration
# code block defined between do and end

# block is a chunk of code that you pass to the method as an argument

#################################### Step 1 : what is block, local scope, block scope
x= 10 # local variable
puts x # can be accesed in local scope
1.upto(5) do |i|
  puts "Hello" + i.to_s
  puts x # can also be accesed in block scope
end

1.upto(5) { |i| puts "Hello" + i.to_s}

# variable scope -> local and block

puts i # returns error as it cannot be accessed in local scope

"Nandinis-MacBook-Pro:week4_prep nandininayak$ irb
2.4.1 :001 > x = 10
 => 10
2.4.1 :002 > arr = [1,2,3,4,5]
 => [1, 2, 3, 4, 5]
2.4.1 :003 > arr.each do |num|
2.4.1 :004 >     puts num + x
2.4.1 :005?>   end
11
12
13
14
15
 => [1, 2, 3, 4, 5]
2.4.1 :006 > num
NameError: undefined local variable or method `num' for main:Object
	from (irb):6
	from /Users/nandininayak/.rvm/rubies/ruby-2.4.1/bin/irb:11:in `<main>'
2.4.1 :007 > num = 1 " "still uses local variable and not changed in to a block value"
 "=> 1
2.4.1 :008 > arr.each do |num|
2.4.1 :009 >     puts num + x
2.4.1 :010?>   end
11
12
13
14
15
 => [1, 2, 3, 4, 5]
2.4.1 :011 > num
 => 1
2.4.1 :012 > "

########################Step 2: Different Blocks :
# so far we have seen each and map and how useful they were
# find , detect : find one element  -> returns object or nil
# find_all , select : returns an array
# any? , all? , delete_if? - return boolean


Nandinis-MacBook-Pro:week4_prep nandininayak$ irb
2.4.1 :001 > (1..10).find{|i| i%3 == 0}
 => 3
2.4.1 :002 > (1..10).find_all{|i| i%3 == 0}
 => [3, 6, 9]
2.4.1 :003 > (1..10).select{|i| i%3 == 0}
 => [3, 6, 9]
2.4.1 :004 > (1..10).delete_if{|i| i%3 == 0}
NoMethodError: undefined method `delete_if' for 1..10:Range
	from (irb):4
	from /Users/nandininayak/.rvm/rubies/ruby-2.4.1/bin/irb:11:in `<main>'
2.4.1 :005 > [1..10].delete_if{|i| i%3 ==0 }
NoMethodError: undefined method `%' for 1..10:Range
	from (irb):5:in `block in irb_binding'
	from (irb):5:in `delete_if'
	from (irb):5
	from /Users/nandininayak/.rvm/rubies/ruby-2.4.1/bin/irb:11:in `<main>'
2.4.1 :006 > [*1..10].delete_if{|i| i%3 == 0 }
 => [1, 2, 4, 5, 7, 8, 10]

2.4.1 :008 > [*1..10].any?{|i| i%3 == 0 }
 => true
2.4.1 :009 > [*1..10].all?{|i| i%3 == 0 }
 => false
2.4.1 :010 >
################################################################################
# Step 3: ############# merge : only with hashes
# step 1: explain simple merge : h1.merge(h2) and h2.merge(h1)
#################################################################################
# 2.4.1 :010 > h1 = {a: 100 , b: 200 , c: 300}
#  => {:a=>100, :b=>200, :c=>300}
# 2.4.1 :011 > h2 = {a: 100 , b: 300 , c: 300}
#  => {:a=>100, :b=>300, :c=>300}
# 2.4.1 :012 > "notice the value of b has changed"
#  => "notice the value of b has changed"
# 2.4.1 :013 > h1.merge(h2)
#  => {:a=>100, :b=>300, :c=>300}
# 2.4.1 :014 > "notice the new value of b is taken after merging"
#  => "notice the new value of b is taken after merging"
# 2.4.1 :015 > h2.merge(h1)
#  => {:a=>100, :b=>200, :c=>300}
# 2.4.1 :016 > "notice the old value of b is taken after merging"
#  => "notice the old value of b is taken after merging"
# 2.4.1 :017 > "lets see how block could be useful here"
#  => "lets see how block could be useful here"
# 2.4.1 :018 > h1.merge(h2){|key,old,new| old}
#  => {:a=>100, :b=>200, :c=>300}
# 2.4.1 :019 > "notice old value is used"
#  => "notice old value is used"
# 2.4.1 :020 > h1.merge(h2){|key,old,new| new}
#  => {:a=>100, :b=>300, :c=>300}
# 2.4.1 :021 > "notice new value is used, also you could do other stuffs like?"
#  => "notice new value is used, also you could do other stuffs like?"
# 2.4.1 :022 > h1.merge(h2){|key,old,new| new * 2}
#  => {:a=>200, :b=>600, :c=>600}
# 2.4.1 :023 > h1.merge(h2) do |k,o,n|
# 2.4.1 :024 >     if o < n
# 2.4.1 :025?>     o
# 2.4.1 :026?>     else
# 2.4.1 :027 >       n
# 2.4.1 :028?>     end
# 2.4.1 :029?>   end
#  => {:a=>100, :b=>200, :c=>300}
# 2.4.1 :031 > h1.merge(h2) { |k,o,n| o<n ? o : n}
#  => {:a=>100, :b=>200, :c=>300}
# 2.4.1 :032 >

###################step 4: sort : uses code block
# spaceship operator : <=> , return -1 (va11 < val2), 0 (val1 == val2) , 1(val1 > val2)
# 2.4.1 :035 > 1 <=> 2
#  => -1
# 2.4.1 :036 > 2 <=> 2
#  => 0
# 2.4.1 :037 > 2 <=> 1
#  => 1
# 2.4.1 :038 >

2.4.1 :038 > array = [3,1,5,4,2]
 => [3, 1, 5, 4, 2]
2.4.1 :039 > array.sort
 => [1, 2, 3, 4, 5]

 # with block you can add more complexity - > eg: line 143
2.4.1 :040 > array.sort {|v1,v2| v1 <=> v2}
 => [1, 2, 3, 4, 5]
2.4.1 :041 > array.sort {|v1,v2| v2 <=> v1}
 => [5, 4, 3, 2, 1]
2.4.1 :042 >

########################## get into more details with strings
