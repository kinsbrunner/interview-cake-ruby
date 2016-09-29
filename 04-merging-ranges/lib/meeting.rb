class Meeting
  def condense_meeting_times(meetings)
    # sort by start times
    meetings.sort!
    
    # initialize merged_meetings with the earliest meeting
    condensed = [meetings[0]]
    
    meetings[1..-1].each do |current_start, current_end|
      previous_start, previous_end = condensed[-1]
      
      # if the current and last meetings overlap, use the latest end time
      if previous_end >= current_start
        condensed[-1] = [previous_start, [previous_end, current_end].max]
      else
        # add the current meeting since it doesn't overlap
        condensed << [current_start, current_end]
      end
    end
    
    return condensed
  end
end