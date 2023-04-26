"""
    is_leap_year(year)

Return `true` if `year` is a leap year in the gregorian calendar.

"""
function is_leap_year(year)
    if year % 4 == 0
        if year % 100 == 0
            if year % 400 == 0
                return true
            else
                return false
            end
        else
            return true
        end
    end

    return false
end

