def is_single_riffle(half1, half2, shuffled_deck)
  half1_index = 0
  half2_index = 0
  half1_max_index = half1.length - 1
  half2_max_index = half2.length - 1

  shuffled_deck.each do |card|
    # if we still have cards in half1
    # and the "top" card in half1 is the same
    # as the top card in shuffled_deck
    if half1_index <= half1_max_index && card == half1[half1_index]
      half1_index += 1
      
    # if we still have cards in half2
    # and the "top" card in half2 is the same
    # as the top card in shuffled_deck
    elsif half2_index <= half2_max_index && card == half2[half2_index]
      half2_index += 1

    # if the top card in shuffled_deck doesn't match the top
    # card in half1 or half2, this isn't a single riffle.
    else
      return false
    end
  end

  # all cards in shuffled_deck have been "accounted for"
  # so this is a single riffle!
  return true
end


shuffled_deck = [2, 4, 6, 8, 10, 1, 3, 5, 7, 9]
# FALSE halves
half1 = [1, 2, 3, 4, 5]
half2 = [6, 7, 8, 9, 10]
# TRUE halves
half3 = [2, 6, 10, 1, 3, 5]
half4 = [4, 8, 7, 9]
# TRUE halves
half5 = [2, 4, 6, 8, 10]
half6 = [1, 3, 5, 7, 9]

puts "Resulta for halves 1 & 2: #{is_single_riffle(half1, half2, shuffled_deck)}"
puts "Resulta for halves 3 & 4: #{is_single_riffle(half3, half4, shuffled_deck)}"
puts "Resulta for halves 5 & 6: #{is_single_riffle(half5, half6, shuffled_deck)}"