vim9script

# Clean up user-entered phone numbers so that they can be sent SMS messages.
#
# Example:
#
#   :echo ToNANP('1 (613)-995-0253')
#   6139950253
#
def g:ToNANP(n: string): string
  if n->HasAllDigits() && n->HasCorrectLength()
    return string(n->str2nr() % 10000000000)
  endif

  var segments = n->split('\D')->filter((_, e) => !e->empty())

  var just_num = segments->join('')
  if !just_num->HasCorrectLength()
    return ''
  endif

  # The end of the array is more stable than the beginning. It's better to index
  # on the end than index on the beginning. This negative indices just look back
  var idsz = [-2, -3]
  for i in idsz
    if !segments[i]->BeginsWith_2to9()
      return ''
    endif
  endfor

  return segments[-3 : -1]->join('')
enddef

def HasCorrectLength(s: string): bool
  return s->len() == 10 || (s[0] == '1' && s->len() == 11)
enddef

def HasAllDigits(s: string): bool
  return s->len() == s->str2nr()->len()
enddef

def BeginsWith_2to9(s: string): bool
  return s->str2nr() > 199 && s->str2nr() < 1000
enddef

defcompile
