function [ hhmm ] = convert_string( time )
    %convert time to time string
    hours = floor(time/60); % Divide time to get hours and truncate
    minutes = mod(time, 60); % Divide time to get hours and get the modulus
    if(hours < 10) % If hours is less than 10 we have to preappend a 0
        hhmm(1) = '0';
        hhmm(2) = num2str(hours); % Add the actual hours
    else
        hhmm(1:2) = num2str(hours); % Add the actual hours
    end
    if(minutes < 10) % If minutes is less than 10 we have to preappend a 0
        hhmm(3) = '0';
        hhmm(4) = num2str(minutes); % Add the actual minutes
    else
        hhmm(3:4) = num2str(minutes); % Add the actual minutes
    end
end

