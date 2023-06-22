function raindrops(number)
    result = ""
    if mod(number, 3) == 0
        result = result * "Pling"
    end
    if mod(number, 5) == 0
        result = result * "Plang"
    end
    if mod(number, 7) == 0
        result = result * "Plong"
    end
    if result == ""
        result = string(number)
    end
    result
end
