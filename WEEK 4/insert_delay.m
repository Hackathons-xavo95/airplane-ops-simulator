function [ fli_new ] = insert_delay( fli, delay )
    % Given a flight fli and a delay in minutes, the function sets the delay of such
    % flight to the value given as parameter and then updates the departure and the arrival times
    % accordingly, adding the delay10, and returns the modified struct in fli_new. If the entered
    % delay is negative (i.e. -1) then the flight is canceled. In such case the returned flight fli_new
    % will set the arrival time equal to the departure time. Also when a flight is canceled the
    % arrival airport will be set equal to the departure airport.
    fli_new = fli;
    if(delay < 0) % Check if the delay is negative as we have to cancel flight then
        fli_new.arrival = fli_new.departure;
        fli_new.arrival_time = fli_new.departure_time;
    else % If delay is positive
        fli_new.delay = delay; % Set the delay
        % Compute new departure_time and arrival_time
        departure_time = convert_time(fli.departure_time) + delay;
        arrival_time = convert_time(fli.arrival_time) + delay;
        if(arrival_time > 1440) % If we arrive on next day
            arrival_time = arrival_time - 1440; % Substract one day from arrival_time
        end
        % Set new departure_time and arrival_time
        fli_new.departure_time = convert_string(departure_time);
        fli_new.arrival_time = convert_string(arrival_time);
    end
end

