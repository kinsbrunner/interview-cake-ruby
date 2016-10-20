class Fibber
  def initialize
    @memo = {}
  end
  
  def fibonacci(n)
    # edge case: negative index
    if n < 0
      raise Exception, "Index was negative. No such thing as a negative index in a series."
    elsif n == 0 || n == 1
      # base case: 0 or 1
      return n
    end

    return @memo[n] if @memo.include?(n)
    
    result = fibonacci(n-1) + fibonacci(n-2)
    
    # memoize
    @memo[n] = result
    
    return result
  end
  
  def fib_iterative(n)
    # edge case: negative index
    if n < 0
      raise Exception, "Index was negative. No such thing as a negative index in a series."
    elsif n == 0 || n == 1
      # base case: 0 or 1
      return n
    end
    
    # we'll be building the fibonacci series from the bottom up
    # so we'll need to track the previous 2 numbers at each step
    prev_prev = 0
    prev = 1
    current = prev + prev_prev
    
    # since we already initialized up to the 2nd number in the series
    # we take n - 2 steps ahead to reach n (.times is exclusive)
    (n - 1).times do
      current = prev + prev_prev
      prev_prev = prev
      prev = current
    end
    
    return current
  end
end