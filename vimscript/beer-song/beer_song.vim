vim9script

#
# Produce the lyrics to that beloved classic, that field-trip favorite: 99
# Bottles of Beer on the Wall.
#
#   :echo Verse(99)
#   99 bottles of beer on the wall, 99 bottles of beer.
#   Take one down and pass it around, 98 bottles of beer on the wall.
#
#
#   :echo Verses(99, 98)
#   99 bottles of beer on the wall, 99 bottles of beer.
#   Take one down and pass it around, 98 bottles of beer on the wall.
#
#   98 bottles of beer on the wall, 98 bottles of beer.
#   Take one down and pass it around, 97 bottles of beer on the wall.
#

def PluralizeBottle(count: number): string
  if count > 1
    return "bottles"
  endif

  return "bottle"
enddef

def g:Verse(verse: number): string
  if verse == 0
    return "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
  endif

  if verse == 1
    return "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
  endif

  return verse .. " " .. verse->PluralizeBottle() .. " of beer on the wall, " .. verse .. " bottles of beer.\nTake one down and pass it around, " .. (verse - 1)->string() .. " " .. (verse - 1)->PluralizeBottle() .. " of beer on the wall.\n"
enddef

def g:Verses(start: number, end: number): string
  var i: number = start
  var result: string
  while i >= end
    if i == end
      result ..= g:Verse(i)
    else
      result ..= g:Verse(i) .. "\n"
    endif
    i -= 1
  endwhile
  return result
enddef

defcompile
