function [ sc2, result ] = absorb_delay( sc, dep_time, delay )
    % Given a schedule sc, a time value with format HHMM indicating the current
    % departure time, dep_time, and another indicating the delay in minutes for such flight,
    % delay, this function checks if the new schedule is compatible11 and in this case returns in
    % sc2 the new schedule of the aircraft and a true in result. If the new schedule is not
    % compatible then the returned sc2 shall be a copy of the input schedule sc and results shall
    % be false. A negative delay or a delay greater than 3 hours are also considered not
    % compatible. Use functions find_flight, insert_delay and check_schedule inside this function.
    sc2 = sc;
    if(delay < 0 || delay > 180) % A negative delay(canceled) or more than 3 hours is unaceptable
        result = false;
    else
        ind = find_flight(sc, dep_time); % Find the flight index by departure time in the schedule
                                         % (as is not stated on the guide we don't have to check if 
                                         % the flight is in the schedule, because we are sure that it will
                                         % be there                                  
        temporal_flight = insert_delay(sc.flights(ind), delay); % Create a temporal flight holding the new delay
        temporal_schedule = init_schedule(temporal_flight); % Create an empty schedule with the next flight to 
                                                            % check if it will be compatible
        [~, rows] = size(sc.flights); % Compute the size of schedule flights
        if(ind < rows)
            result = check_schedule(temporal_schedule, sc2.flights(ind + 1)); % Check if it's compatible
        else
            result = true; % As it's the last one it's always compatible
        end
    end
    if(~result)
        sc2 = sc; % As result is false, return a copy of original schedule
    else
        sc2.flights(ind) = temporal_flight; % As result is true, save the modified flight
    end
end