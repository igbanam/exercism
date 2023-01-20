vim9script

#
# This function takes a year and returns 1 if it's a leap year
# and 0 otherwise.
#
def g:LeapYear(year: number): number

  # your implementation goes here

  if year % 4 == 0
    if year % 100 == 0
      if year % 400 == 0
        return 1
      else
        return 0
      endif
    endif
    return 1
  else
    return 0
  endif

enddef

defcompile
