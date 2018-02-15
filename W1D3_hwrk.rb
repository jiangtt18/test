require "byebug"
# Write a function sum_to(n) that uses recursion to calculate the sum from 1 to n (inclusive of n).
#
#   # Test Cases
#   sum_to(5)  # => returns 15
#   sum_to(1)  # => returns 1
#   sum_to(9)  # => returns 45
#   sum_to(-8)  # => returns nil

def sum_to(n)

return 1 if n == 1
sum_to(n-1) + n if n > 1

end


# Exercise 2 - add_numbers
# Write a function add_numbers(nums_array) that takes in an array of Fixnums and returns the sum of those numbers. Write this method recursively.
#
#   # Test Cases
#   add_numbers([1,2,3,4]) # => returns 10
#   add_numbers([3]) # => returns 3
#   add_numbers([-80,34,7]) # => returns -39
#   add_numbers([]) # => returns nil

def add_numbers(arr)
  return nil if arr.empty?
  return arr.first if arr.length == 1
  add_numbers(arr[1..-1]) + arr.first
end

# Exercise 3 - Gamma Function
# Let's write a method that will solve Gamma Function recursively. The Gamma Function is defined Γ(n) = (n-1)!.
#
#   # Test Cases
#   gamma_fnc(0)  # => returns nil
#   gamma_fnc(1)  # => returns 1
#   gamma_fnc(4)  # => returns 6
#   gamma_fnc(8)  # => returns 5040

def gamma_fnc(int)
  return nil if int == 0
  return 1 if int == 1
  factorial(int - 1)
end
# Exercise 4 - Ice Cream Shop
# Write a function ice_cream_shop(flavors, favorite) that takes in an array of ice cream flavors available at the ice cream shop, as well as the user's favorite ice cream flavor. Recursively find out whether or not the shop offers their favorite flavor.
#
#   # Test Cases
#   ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
#   ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
#   ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
#   ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
#   ice_cream_shop([], 'honey lavender')  # => returns false


def ice_cream_shop(flavors, favorite)
  return true if flavors.first == favorite
  return false if flavors.empty?
  ice_cream_shop(flavors[1..-1], favorite)
end

# Exercise 5 - Reverse
# Write a function reverse(string) that takes in a string and returns it reversed.
#
#   # Test Cases
#   reverse("house") # => "esuoh"
#   reverse("dog") # => "god"
#   reverse("atom") # => "mota"
#   reverse("q") # => "q"
#   reverse("id") # => "di"
#   reverse("") # => ""

def reverse(string)
  return "" if string.empty?
  return string if string.length == 1
  reverse(string.slice!(1..-1)) + string[0]
end

private
  def factorial(n)
    return 1 if n == 1
    factorial(n-1) * n
  end
