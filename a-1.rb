# Given an array of unique integers ordered from least to greatest, write a
# method that returns an array of the integers that are needed to
# fill in the consecutive set.
#10.42 - 11 : 22
def missing_numbers(nums)
  missing = Array.new
  nums.each_with_index do |int,i|
    next_int = nums[i+1]
    missed_int = int + 1
    while missed_int != next_int && i < nums.length - 1

      missing << missed_int
      missed_int += 1
    end
  end
  missing
end

# Write a method that given a string representation of a binary number will
# return that binary number in base 10.
#
# To convert from binary to base 10, we take the sum of each digit multiplied by
# two raised to the power of its index. For example:
#   1001 = [ 1 * 2^3 ] + [ 0 * 2^2 ] + [ 0 * 2^1 ] + [ 1 * 2^0 ] = 9
#
# You may NOT use the Ruby String class's built in base conversion method.

def base2to10(binary)
  arr =  binary.to_s.split("")
  base_10 = 0

  arr.each_with_index do |s,i|
    int = s.to_i
    exp = arr.length - 1 - i
    base_10 += int * (2 ** exp )
  end
  base_10

end

class Hash

  # Hash#select passes each key-value pair of a hash to the block (the proc
  # accepts two arguments: a key and a value). Key-value pairs that return true
  # when passed to the block are added to a new hash. Key-value pairs that return
  # false are not. Hash#select then returns the new hash.
  #
  # Write your own Hash#select method by monkey patching the Hash class. Your
  # Hash#my_select method should have the functionailty of Hash#select described
  # above. Do not use Hash#select in your method.

  def my_select(&prc)
    my_hash = Hash.new
    self.each do |k,v|
      valid = proc.call(k,v)
      my_hash[k] = v if valid
    end
    my_hash

  end

end

class Hash

  # Hash#merge takes a proc that accepts three arguments: a key and the two
  # corresponding values in the hashes being merged. Hash#merge then sets that
  # key to the return value of the proc in a new hash. If no proc is given,
  # Hash#merge simply merges the two hashes.
  #
  # Write a method with the functionality of Hash#merge. Your Hash#my_merge method
  # should optionally take a proc as an argument and return a new hash. If a proc
  # is not given, your method should provide default merging behavior. Do not use
  # Hash#merge in your method.

  def my_merge(hash, &prc)
    new_hash = Hash.new

    self.each do |k,v|
      if hash.include?(k)
        if block_given?
          new_hash[k] = prc.call(k, v, hash[k])
        else
          new_hash[k] = hash[k]
        end
      else
        new_hash[k] = v
      end
    end
    hash.each do |k,v|
      unless self.include?(k)
        new_hash[k] = v
      end
    end
    new_hash
  end

end

# The Lucas series is a sequence of integers that extends infinitely in both
# positive and negative directions.
#
# The first two numbers in the Lucas series are 2 and 1. A Lucas number can
# be calculated as the sum of the previous two numbers in the sequence.
# A Lucas number can also be calculated as the difference between the next
# two numbers in the sequence.
#
# All numbers in the Lucas series are indexed. The number 2 is
# located at index 0. The number 1 is located at index 1, and the number -1 is
# located at index -1. You might find the chart below helpful:
#
# Lucas series: ...-11,  7,  -4,  3,  -1,  2,  1,  3,  4,  7,  11...
# Indices:      ... -5, -4,  -3, -2,  -1,  0,  1,  2,  3,  4,  5...
#
# Write a method that takes an input N and returns the number at the Nth index
# position of the Lucas series.


def lucas_numbers(n)
  lucas = [2,1]
  i = [0,1]
  cur_i = 1
  left = 2
  right = 1
  result = 0
  n = -n if n < 0

  while cur_i <= n
    result = left + right
    lucas << result
    i << cur_i + 1
    left,right = right,result
    cur_i += 1
  end

  if n >= 0
    lucas[n]
  else
    -lucas[n]
  end


end

[]

# A palindrome is a word or sequence of words that reads the same backwards as
# forwards. Write a method that returns the longest palindrome in a given
# string. If there is no palindrome longer than two letters, return false.



def longest_palindrome(string)
  len = string.length
  arr = string.split("")
  max = 0
  arr.each_index do |i|
    j = i+1
    while j <  len
      subarr = arr[i..j]
      count = subarr.length if subarr == subarr.reverse
      max = [count.to_i, max].max
      j += 1
    end
  end
  max

end
