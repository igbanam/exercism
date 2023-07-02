vim9script

#
# Given a phrase, return a dictionary containing the count of occurrences of
# each word.
#
# Example:
#
#   :echo WordCount('olly olly in come free')
#   {'olly': 2, 'come': 1, 'in': 1, 'free': 1}
#
def g:WordCount(phrase: string): dict<number>
  var result = {}
  for word in phrase->tolower()->split("[^[:alnum:]']\\+")
    var the_key = word->substitute("^'\\(.*\\)'$", '\1', '')
    result[the_key] = result->get(word) + 1
  endfor
  return result
enddef

defcompile
