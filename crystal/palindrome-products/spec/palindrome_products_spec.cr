require "spec"
require "../src/*"

describe "PalindromeProducts" do
  it "find the smallest palindrome from single digit factors" do
    palindrome = PalindromeProducts.new(1, 9)
    palindrome.smallest.should eq({1, [[1, 1]]})
  end

  it "find the largest palindrome from single digit factors" do
    palindrome = PalindromeProducts.new(1, 9)
    result = palindrome.largest
    result[0].should eq 9
    [[[1, 9], [3, 3]], [[3, 3], [1, 9]]].should contain result[1]
  end

  it "find the smallest palindrome from double digit factors" do
    palindrome = PalindromeProducts.new(10, 99)
    palindrome.smallest.should eq({121, [[11, 11]]})
  end

  it "find the largest palindrome from double digit factors" do
    palindrome = PalindromeProducts.new(10, 99)
    palindrome.largest.should eq({9009, [[91, 99]]})
  end

  it "find the smallest palindrome from triple digit factors" do
    palindrome = PalindromeProducts.new(100, 999)
    palindrome.smallest.should eq({10201, [[101, 101]]})
  end

  it "find the largest palindrome from triple digit factors" do
    palindrome = PalindromeProducts.new(100, 999)
    palindrome.largest.should eq({906609, [[913, 993]]})
  end

  it "find the smallest palindrome from four digit factors" do
    palindrome = PalindromeProducts.new(1000, 9999)
    palindrome.smallest.should eq({1002001, [[1001, 1001]]})
  end

  it "find the largest palindrome from four digit factors" do
    palindrome = PalindromeProducts.new(1000, 9999)
    palindrome.largest.should eq({99000099, [[9901, 9999]]})
  end

  it "empty result for smallest if no palindrome in the range" do
    palindrome = PalindromeProducts.new(1002, 1003)
    palindrome.smallest.should eq({nil, [] of Int32})
  end

  it "empty result for largest if no palindrome in the range" do
    palindrome = PalindromeProducts.new(15, 15)
    palindrome.largest.should eq({nil, [] of Int32})
  end

  it "error result for smallest if min is more than max" do
    palindrome = PalindromeProducts.new(10000, 1)
    expect_raises(ArgumentError) do
      palindrome.smallest
    end
  end

  it "error result for largest if min is more than max" do
    palindrome = PalindromeProducts.new(2, 1)
    expect_raises(ArgumentError) do
      palindrome.largest
    end
  end

  it "smallest product does not use the smallest factor" do
    palindrome = PalindromeProducts.new(3215, 4000)
    palindrome.smallest.should eq({10988901, [[3297, 3333]]})
  end
end
