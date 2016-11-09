require 'set'

class String
  def has_palindrome_permutation(the_string)
    # track characters we've seen an odd number of times
    unpaired_characters = Set.new

    (0...the_string.length).each do |i|
      char = the_string[i]

      if unpaired_characters.include? char
        unpaired_characters.delete(char)
      else
        unpaired_characters.add(char)
      end
    end

    # the string has a palindrome permutation if it
    # has one or zero characters without a pair
    unpaired_characters.length <= 1
  end
  
  def get_permutations_rec(string)
    # base case
    if string.length <= 1
      return Set.new [string]
    end

    all_chars_except_last = string[0..-2]
    last_char = string[-1]

    # recursive call: get all possible permutations for all chars except last
    permutations_of_all_chars_except_last = get_permutations_rec(all_chars_except_last)

    # put the last char in all possible positions for each of the above permutations
    permutations = Set.new
    permutations_of_all_chars_except_last.each do |permutation_of_all_chars_except_last|
        (0..all_chars_except_last.length).each do |position|
            permutation = permutation_of_all_chars_except_last[0...position] + last_char + permutation_of_all_chars_except_last[position..-1]
            permutations.add(permutation)
        end
    end

    permutations
  end
end
