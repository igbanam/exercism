# Please implement your solution to proverb in this file

class Proverb
  def self.recite(input : Array(String))
    output = [] of String

    return [] of String if input.empty?

    input << input.first

    recant(input, output)
  end

  private def self.recant(input : Array(String), accumulator : Array(String))
    if input.empty?
      return accumulator
    else
      if input.size <= 2
        accumulator << "And all for the want of a #{input.last}."
        input = [] of String
      else
        accumulator << "For want of a #{input.shift} the #{input.first} was lost."
      end
      recant(input, accumulator)
    end
  end
end
