class PalindromeProducts
  def initialize(@left : Int32, @right : Int32)
  end

  def smallest
    raise ArgumentError.new if @left > @right

    the_smallest = Int32::MAX
    factors = [] of Array(Int32)

    (@left..@right).each do |i|
      (i..@right).each do |j|
        k = i * j
        if k == the_smallest
          factors << [i, j]
        elsif k < the_smallest && is_palindrome?(k)
          the_smallest = k
          factors = [[i, j]]
        end
      end
    end

    the_smallest = nil if factors.empty?
    return { the_smallest, factors }
    nil
  end

  def largest
    raise ArgumentError.new if @left > @right

    the_largest = 0
    factors = [] of Array(Int32)

    (@left..@right).reverse_each do |i|
      (i..@right).reverse_each do |j|
        k = i * j
        if k == the_largest
          factors << [i, j]
        elsif k > the_largest && is_palindrome?(k)
          the_largest = k
          factors = [[i, j]]
        end
      end
    end

    the_largest = nil if factors.empty?
    return { the_largest, factors }
  end

  def is_palindrome?(k)
    k.to_s == k.to_s.reverse
  end
end
