class Change
  def num_ways(amount, denominations) #bottom_up strategy / dynamic programming
    ways_of_doing_n_cents = [0] * (amount+1)
    ways_of_doing_n_cents[0] = 1
    
    denominations.each do |coin|
      (coin..amount).each do |higher_amount|
        higher_amount_remainder = higher_amount - coin
        ways_of_doing_n_cents[higher_amount] += ways_of_doing_n_cents[higher_amount_remainder]
      end
    end
    
    ways_of_doing_n_cents[amount]
  end 
end