class Product
  def productOfAllNums(numbers)
    n = numbers.length
    result = []
    
    temp_total = 1
    (0..n-1).each do |i|
      result << temp_total
      temp_total *= numbers[i]
    end

    temp_total = 1
    i = n - 1 
    while i >= 0
      result[i] *= temp_total
      temp_total *= numbers[i]
      i -= 1
    end
    
    return result
  end
end