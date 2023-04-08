vim9script

#
# This def takes a DNA strand and returns its RNA complement.
#
#   G -> C
#   C -> G
#   T -> A
#   A -> U
#
# If the input is invalid, return an empty string.
#
# Example:
#
#   :echo ToRna('ACGTGGTCTTAA')
#   UGCACCAGAAUU
#

const TRANSLATION = {
  'G': 'C',
  'C': 'G',
  'T': 'A',
  'A': 'U',
}

def g:ToRna(strand: string): string
  var result: string = strand
    ->split('\zs')
    ->map((_, v) => TRANSLATION->get(v, ''))
    ->join()
    ->substitute(' ', '', 'g')

  if result->len() != strand->len()
    return ''
  endif

  return result
enddef

defcompile
