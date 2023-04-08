vim9script

#
# This def takes any remark and returns Bob's response.
#
def g:Response(remark: string): string

  var tester = remark
    ->substitute(',', " ", "g")
    ->trim()

  if tester == ''
    return "Fine. Be that way!"
  elseif tester->IsAllCaps() && remark->IsQuestion()
    return "Calm down, I know what I'm doing!"
  elseif tester->IsQuestion()
    return "Sure."
  elseif tester->IsAllCaps()
    return "Whoa, chill out!"
  endif

  return "Whatever."

enddef

def IsQuestion(s: string): bool
  return s[-1] == "?"
enddef

def IsAllCaps(s: string): bool
  return s =~ '\a' && s->toupper() ==# s
enddef

defcompile
