vim9script

def Transformer(s: string): string
  return s->tolower()->str2list()->sort()->list2str()
enddef

#
# Given a word and a list of possible anagrams, select the correct sublist.
#
# Example:
#
#   :echo FindAnagrams(['foo', 'bar', 'oof', 'Ofo'], 'foo')
#   ['Ofo', 'oof']
#
def g:FindAnagrams(candidates: list<string>, subject: string): list<string>

  return candidates->filter((_, v) => subject->tolower() != v->tolower() && v->Transformer() == subject->Transformer())

enddef

defcompile
