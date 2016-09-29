class Product
  def get_highest_product_of_3(numbers)
    if numbers.length < 3
      raise Exception, 'Getting a result requires at least 3 values'
    end
    
    # We're going to start at the 3rd item (at index 2)
    # so pre-populate highests and lowests based on the first 2 items.
    # we could also start these as nil and check below if they're set
    # but this is arguably cleaner
    highest = [numbers[0], numbers[1]].max
    lowest = [numbers[0], numbers[1]].min
    h_prod_2 = numbers[0] * numbers[1]
    l_prod_2 = numbers[0] * numbers[1]
    highest_product_of_three = numbers[0] * numbers[1] * numbers[2]
    temp_multi = 0
    
    numbers.each_with_index do |current_number, i|
      next if i < 2
      
      # do we have a new highest product of 3?
      # it's either the current highest,
      # or the current times the highest product of two
      # or the current times the lowest product of two
      highest_product_of_three = [ 
                                  highest_product_of_three, 
                                  current_number * h_prod_2, 
                                  current_number * l_prod_2
                                 ].max
    
      # do we have a new highest product of two?
      h_prod_2 = [h_prod_2, highest * current_number, lowest * current_number].max
      
      # do we have a new lowest product of two?
      l_prod_2 = [l_prod_2, highest * current_number, lowest * current_number].min
      
      # do we have a new highest?
      highest = [highest, current_number].max
      
      # do we have a new lowest?
      lowest = [lowest, current_number].min
    end
    
    return highest_product_of_three
  end
end