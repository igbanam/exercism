"""
    count_nucleotides(strand)

The count of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""
function count_nucleotides(strand)
    tally = Dict('A' => 0, 'C' => 0, 'G' => 0, 'T' => 0)
    for i = firstindex(strand):lastindex(strand)
        push!(tally, strand[i] => get(tally, strand[i], 0) + 1)
    end
    if length(tally) > 4
        throw(DomainError(tally))
    else
        return tally
    end
end
