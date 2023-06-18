struct Int32
  def factors : Array(Int32)
    num = self - 1
    result = [] of Int32

    while num > 0
      result << num if self % num == 0
      num -= 1
    end
    result
  end
end

module PerfectNumbers
  def self.classify(num : Number) : String
    # Write your code for the 'Perfect Numbers' exercise in this file.
    case
    when num < 1
      raise ArgumentError.new
    when num.as(Int32).factors.sum == num
      "perfect"
    when num.as(Int32).factors.sum > num
      "abundant"
    when num.as(Int32).factors.sum < num
      "deficient"
    else
      ""
    end
  end
end
