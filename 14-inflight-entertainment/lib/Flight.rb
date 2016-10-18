class Flight
  attr_reader :flight_length
  
  def initialize(length)
    @flight_length = length
  end
  
  def can_two_movies_fill_flight(movie_lengths)
    # movie lengths we've seen so far
    movie_lengths_seen = Set.new

    movie_lengths.each do |first_movie_length|
      matching_second_movie_length = flight_length - first_movie_length
      
      if movie_lengths_seen.include? matching_second_movie_length
        return true
      end

      movie_lengths_seen.add(first_movie_length)
    end

    # we never found a match, so return False
    return false
  end
end