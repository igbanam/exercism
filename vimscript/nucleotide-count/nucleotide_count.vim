vim9script

# Given a DNA string, compute how many times each nucleotide occurs in the
# string.
#
# Examples:
#
#   :echo NucleotideCounts('ACGTACGT')
#   {'A': 2, 'C': 2, 'T': 2, 'G': 2}
#
#   :echo NucleotideCounts('ACGTXACGT')
#   E605: Exception not caught: Invalid nucleotide in strand
#

def g:NucleotideCounts(strand: string): dict<any>
  var result: dict<any> = {
    'A': 0,
    'C': 0,
    'G': 0,
    'T': 0
  }

  for nucleotide in strand->toupper()->split('\zs')
    if result->has_key(nucleotide)
      result[nucleotide] += 1
    else
      throw 'Invalid nucleotide in strand'
    endif
  endfor

  return result
enddef

defcompile
