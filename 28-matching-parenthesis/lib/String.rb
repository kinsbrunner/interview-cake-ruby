class String
  def get_closing_parenthesis(sentence, open_paren_index)
    open_nested_paren = 0
    (open_paren_index + 1).upto(sentence.length - 1) do |position|
      char = sentence[position]
      
      if char == '('
        open_nested_paren += 1
      elsif char == ')'
        if open_nested_paren == 0
          return position
        else
          open_nested_paren -= 1
        end
      end
    end
    
    raise Exception, "No parenthesis found! :("
  end
end
