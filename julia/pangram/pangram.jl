"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
function ispangram(input)
    tally = Dict()
    input = lowercase(input)
    input = replace(input, r"[ _\d\.\"]" => s"")
    for i = firstindex(input):lastindex(input)
        try
            tally[input[i]] = get(tally, input[i], 0) + 1
        catch StringIndexError
            tally["weird"] = get(tally, "weird", 0) + 1
        end
    end
    length(tally) == 26
end

