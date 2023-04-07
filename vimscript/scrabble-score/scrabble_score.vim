vim9script

# Given a word, return the scrabble score for that word.
#
#    Letter                           Value
#    A, E, I, O, U, L, N, R, S, T     1
#    D, G                             2
#    B, C, M, P                       3
#    F, H, V, W, Y                    4
#    K                                5
#    J, X                             8
#    Q, Z                             10

const LETTER_VALUES = {
  1: ['a', 'e', 'i', 'o', 'u', 'l', 'n', 'r', 's', 't'],
  2: ['d', 'g'],
  3: ['b', 'c', 'm', 'p'],
  4: ['f', 'h', 'v', 'w', 'y'],
  5: ['k'],
  8: ['j', 'x'],
  10: ['q', 'z'],
}

def g:Score(word: string): number 
  if word == ""
    return 0
  endif

  var chars: list<any> = word->tolower()->split('\zs')
  return chars
    ->map((i: number, v: string) => GetLetterScore(v))
    ->reduce((acc, val) => acc + val)
enddef

def GetLetterScore(letter: string): number
  if letter->len() != 1
      throw "ScrabbleScoreError: Letter should be one character only"
      finish
  endif

  for [score, letters] in LETTER_VALUES->items()
    if letters->index(letter) != -1
      return score->str2nr()
    endif
  endfor

  return 0
enddef

defcompile
