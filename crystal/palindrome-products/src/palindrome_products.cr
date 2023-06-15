class PalindromeProducts
  property left : Int32
  property right : Int32
  property products

  # Write your code for the 'Palindrome Products' exercise in this file.
  def initialize(@left, @right)
    @products = Hash(Int32, Array(Array(Int32))).new
    o = (left..right).to_a
    o
      .cartesian_product(o)
      .select { |f| is_palindrome?(f[0] * f[1]) }
      .each do |f|
      k = f[0] * f[1]
      factors = f.to_a.sort
      if products.has_key? k
        products[k] << factors
        products[k].uniq!
      else
        products[k] = [factors]
      end
    end
  end

  def smallest
    raise ArgumentError.new if left > right

    return {nil, [] of Int32} if products.empty?

    products
      .min_by { |k, _| k }
  end

  def largest
    raise ArgumentError.new if left > right

    return {nil, [] of Int32} if products.empty?

    products
      .max_by? { |k, _| k }
      .not_nil!
  end

  def is_palindrome?(k)
    k.to_s == k.to_s.reverse
  end
end
