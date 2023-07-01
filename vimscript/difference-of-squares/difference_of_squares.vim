vim9script

#
# Find the difference between the square of the sum and the sum of the squares
# of the first N natural numbers.
#
# Examples:
#
#   :echo SquareOfSum(3)
#   36
#   :echo SumOfSquares(3)
#   14
#   :echo DifferenceOfSquares(3)
#   22
#
def g:DifferenceOfSquares(n: number): number
  return g:SquareOfSum(n) - g:SumOfSquares(n)
enddef

def g:SquareOfSum(n: number): number
  var d = range(n + 1)->Sum()
  return d * d
enddef

def g:SumOfSquares(n: number): number
  return range(n + 1)->map((_, v) => v * v)->Sum()
enddef

def Sum(a: list<number>): number
  return a->reduce((acc, val) => acc + val)
enddef

defcompile
