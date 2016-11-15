def get_random(floor, ceiling)
  rand(floor..ceiling)
end

def shuffle(the_array)
  # if it's 1 or 0 items, just return
  return the_array if the_array.length <= 1
  
  last_index_in_the_array = the_array.length - 1

  # walk through from beginning to end
  (0...the_array.length).each do |index_we_are_choosing_for|
    # choose a random not-yet-placed item to place there
    # (could also be the item currently in that spot)
    # must be an item AFTER the current item, because the stuff
    # before has all already been placed
    random_choice_index = get_random(index_we_are_choosing_for, last_index_in_the_array)

    # place our random choice in the spot by swapping
    the_array[index_we_are_choosing_for], the_array[random_choice_index] = the_array[random_choice_index], the_array[index_we_are_choosing_for]
  end
  the_array
end


initial = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
result = shuffle(initial)
p result