vim9script

# This function takes two strings which represent strands and returns
# their Hamming distance.
#
# If the lengths of the strands don't match, throw this exception:
#
#     'left and right strands must be of equal length'
#
def g:Distance(strand1: string, strand2: string): number

  if strand1->len() != strand2->len()
    throw 'left and right strands must be of equal length'
  endif

  var i = 0
  var distance = 0

  while i < strand1->len()
    if strand1[i] !=# strand2[i]
      distance += 1
    endif

    i += 1
  endwhile

  return distance

enddef

defcompile
