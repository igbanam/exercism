using Dates

struct Clock
    hour::Int8
    minute::Int8

    function Clock(hour::Int, minute::Int)
        # TODO: Refactor this block
        if minute < 0
            if minute > -60
                hour = hour - 1
                minute = 60 + (minute % 60)
            else
                hour = hour - 1 + (minute ÷ 60)
                minute = 60 + (minute % 60)
            end
        end

        effective_hour = (hour + (minute ÷ 60)) % 24
        if effective_hour < 0
            effective_hour = 24 + effective_hour
        end
        new(effective_hour, minute % 60)
    end
end

function Base.:+(clock::Clock, minutes::Dates.Minute)
    hour = clock.hour + (minutes.value ÷ 60)
    minute = clock.minute + (minutes.value % 60)
    Clock(hour, minute)
end

function Base.:-(clock::Clock, minutes::Dates.Minute)
    hour = clock.hour - (minutes.value ÷ 60)
    minute = clock.minute - (minutes.value % 60)
    Clock(hour, minute)
end

Base.show(io::IO, clock::Clock) = print(io, '"',"$(lpad(clock.hour, 2, "0")):$(lpad(clock.minute, 2, "0"))",'"')
