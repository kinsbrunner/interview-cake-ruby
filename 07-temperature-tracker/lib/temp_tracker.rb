class TempTracker
  def initialize
    @total_sum = 0.0
    @total_numbers = 0
    @mean_temp = nil
    
    @max_temp = nil
    @min_temp = nil
    
    @ocurrences = [0] * 111 #as problem accepts temps from 0 to 110 Farenheit
    @max_ocurrences = 0
    @mode_temp = nil
  end
  
  def insert(temp)
    @total_numbers += 1
    @total_sum += temp
    @mean_temp = @total_sum / @total_numbers
    
    @max_temp = temp if @max_temp.nil? || temp > @max_temp
    @min_temp = temp if @min_temp.nil? || temp < @min_temp
    
    @ocurrences[temp] += 1
    if @ocurrences[temp] > @max_ocurrences
      @max_ocurrences = @ocurrences[temp]
      @mode_temp = temp
    end
  end
  
  def get_max()
    @max_temp
  end
  
  def get_min()
    @min_temp
  end
  
  def get_mean()
    @mean_temp
  end
  
  def get_mode()
    @mode_temp
  end
end