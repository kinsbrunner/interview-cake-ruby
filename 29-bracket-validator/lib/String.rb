require 'set'

class String
  def is_valid(code)
    openers_to_closers_hash = {
      '(' => ')',
      '{' => '}',
      '[' => ']'
    }

    openers = Set.new(openers_to_closers_hash.keys)
    closers = Set.new(openers_to_closers_hash.values)

    openers_stack = []

    for i in 0...code.length
      char = code[i]
      if openers.include? char
        openers_stack.push(char)
      elsif closers.include? char
        if openers_stack.empty?
          return false
        else
          last_unclosed_opener = openers_stack.pop
          
          # if this closer doesn't correspond to the most recently
          # seen unclosed opener, short-circuit, returning false          
          if openers_to_closers_hash[last_unclosed_opener] != char
            return false
          end
        end
      end
    end
    openers_stack.empty?
  end
end
