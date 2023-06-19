module PythagoreanTriplet
  def self.triplets_with_sum(sum : Int32) : Array(Array(Int32))
    # Write your code for the 'Pythagorean Triplet' exercise in this file.

    triplets = [] of Array(Int32)

    (1...(sum/3)).each do |a|
      ((a + 1)...((sum - a) / 2)).each do |b|
        c = sum - a - b
        triplets << [a, b, c] if (c * c) == ((a * a) + (b * b))
      end
    end

    triplets
  end
end
