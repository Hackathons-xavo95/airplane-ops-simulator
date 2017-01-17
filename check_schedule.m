function [ check ] = check_schedule( sc1, fli )
    % Given the current schedule of an aircraft (sc1) and a new flight (fli) the function
    % returns a boolean value (True/False) indicating if the time of the new flight is compatible
    % with the end-of-operations scheduled time. To be compatible the last flight must have
    % arrived at least 60 minutes before the departure time of the new flight. The function must
    % also ensure that the airports and the aircraft type of the last and new flights are the same5. If
    % the schedule sc1 is empty, then the function returns True.
    if(sc1.operation_start_time == 0 && sc1.operation_stop_time == 0) % Check if schedule is empty
        check = true;
    else
        [~, rows] = size(sc1.flights); % Compute the size of the schedule flights
        % If aircraft type match and arrival and departure match
        if(strcmp(sc1.flights(rows).arrival, fli.departure)  && strcmp(sc1.flights(rows).type, fli.type))
            % Check if the departure time is 60 minutes after the last
            % flight, if true all is good
            if(convert_time(fli.departure_time) > sc1.operation_stop_time + 60)
                check = true;
            else
                check = false;
            end
        else
            check = false;
        end
    end
end

