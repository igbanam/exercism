vim9script

# Determine if a sentence is a pangram.
#
# A pangram is a sentence using every letter of the alphabet at least once.
#
# The alphabet used consists of ASCII letters a to z, inclusive, and is case
# insensitive. Input will not contain non-ASCII symbols.
#
# Example:
#
#     :echo IsPangram('The quick brown fox jumps over the lazy dog')
#     1
#     :echo IsPangram('The quick brown fox jumps over the lazy do')
#     0
#

def g:IsPangram(sentence: string): number
  if sentence
      ->tolower()                       # lower all characters
      ->split('\zs')                    # string to character list
      ->filter((_, e) => e =~ '^\a\+$') # only keep alphas
      ->sort()                          # sort as a pre-req for uniq
      ->uniq()                          # uniq characters
      ->len() == 26
    return 1
  endif

  return 0
enddef

defcompile
