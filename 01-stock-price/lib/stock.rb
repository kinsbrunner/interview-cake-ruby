class Stock 
  def get_max_profit(yesterday_prices)
    # make sure we have at least 2 prices
    if yesterday_prices.length < 2
      raise IndexError, 'Getting a profit requires at least 2 prices'
    end

    # we'll greedily update min_price and max_profit, so we initialize
    # them to the first price and the first possible profit    
    min_price = yesterday_prices[0]
    max_profit = yesterday_prices[1] - yesterday_prices[0]
    
    yesterday_prices.each_with_index do |current_price, index|
      # skip the first time, since we already used it
      # when we initialized min_price and max_profit      
      next if index == 0

      # see what our profit would be if we bought at the
      # min price and sold at the current price
      potential_profit = current_price - min_price      
      
      # update max_profit if we can do better
      max_profit = [max_profit, potential_profit].max
      
      # update min_price so it's always
      # the lowest price we've seen so far
      min_price = [min_price, current_price].min
    end
    
    return max_profit
  end
  
end