function [ sc2 ] = force_delay( sc, dep_time, delay )
    % Given a schedule sc, a time value with format HHMM indicating the current
    % departure time, dep_time, and the delay affecting such flight in minutes, this function
    % forces the insertion of the delay in the designed flight by delaying also the consecutive ones
    % if they can not absorb the delay, and returns the new schedule in sc2. Consecutive flights
    % are delayed the minimum possible. The function will always show a message indicating the
    % number of affected flights. Use functions find_flight, insert_delay and absorb_delay inside
    % this function. The function checks that the delay is a positive number and lower or equal to
    % 3 hours. If not, it prints an error and returns a copy of the input schedule sc.
    sc2 = sc;
    if(delay < 0 || delay > 180) % A negative delay(canceled) or more than 3 hours is unaceptable
        result = false;
    else
        [ new_sc, result ] = absorb_delay(sc, dep_time, delay); % Try if is possible to absorb the delay
                                                                % if not, start a recursive modification
        if(~result)
            ind = find_flight(new_sc, dep_time); % Find the flight index by departure time in the schedule
                                                 % (as is not stated on the guide we don't have to check if 
                                                 % the flight is in the schedule, because we are sure that it will
                                                 % be there
            n = ind;
            [~, rows] = size(new_sc.flights);
            while(n<=rows)
                temporal_flight = insert_delay(new_sc.flights(n), delay); % Create a temporal flight holding the new delay
                if(n ~= rows)
                    % Get the ne arrival time, the next departure time, and compute the delta between them
                    temporal_flight_arrival_time = convert_time(temporal_flight.arrival_time);
                    next_flight_departure_time = convert_time(new_sc.flights(n + 1).departure_time);
                    delta = next_flight_departure_time - temporal_flight_arrival_time;
                    % If delta is between 0 and 60, next delay should be the difference
                    if((delta < 60) && (delta > 0))
                        delay = 60 - delta;
                    % If delta is lower than 0, next delay should be the accumulated delay
                    elseif(delta < 0)
                        delay = 60 + abs(delta);
                    % If delta is bigger than 60, next delay should be 0
                    elseif(delta > 60)
                        delay = 0;
                    end
                end
                new_sc.flights(n) = temporal_flight; % Set the flight to the temporal modified version
                n = n + 1;
            end
            result = true;
        end
    end
    if(~result)
        sc2 = sc; % If things gone wrong return a copy of sc
    else
        sc2 = new_sc; % If things gone ok return the new schedule
    end
end