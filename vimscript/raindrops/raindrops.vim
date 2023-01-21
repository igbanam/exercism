vim9script

# Convert a number to a string, the contents of which depend on the number's
# factors.
#
#   - If the number has 3 as a factor, output 'Pling'.
#   - If the number has 5 as a factor, output 'Plang'.
#   - If the number has 7 as a factor, output 'Plong'.
#   - If the number does not have 3, 5, or 7 as a factor, just pass
#     the number's digits straight through.
#
# Example:
#
#   :echo Raindrops(15)
#   PlingPlang

def g:Raindrops(n: number): string
  var result = ''

  if n % 3 == 0
    result = result .. 'Pling'
  endif

  if n % 5 == 0
    result = result .. 'Plang'
  endif

  if n % 7 == 0
    result = result .. 'Plong'
  endif

  if n % 3 == 0 || n % 5 == 0 || n % 7 == 0
    return result
  else
    return string(n)
  endif
enddef

defcompile
