function [ sc ] = add_schedule( sc_old, fli )
    % Given the current schedule of an aircraft (sc1) and a new flight (fli) the function
    % returns a new schedule in which the new flight has been added at the end of the list of flights
    % of the input schedule. Remember to update the end of operation time of the schedule, and in
    % case sc1 was empty, update also the start.
    sc = sc_old;
    [~, rows] = size(sc_old.flights);
    if(sc_old.operation_start_time == 0 && sc_old.operation_stop_time == 0) % Check if sc_old is empty and add
                                                                            % Add the flight to first row
        sc.flights(rows) = fli;
    else
        sc.flights(rows + 1) = fli; % Add the flight to next row, if sc_old has values
    end
    if(sc_old.operation_start_time > convert_time(fli.departure_time) || sc_old.operation_start_time == 0)
        % Check if he have to modify the operation_start_time in case that
        % it's empty or it's smaller
        sc.operation_start_time = convert_time(fli.departure_time);
    end
    if(sc_old.operation_stop_time < convert_time(fli.arrival_time))
        % Check if he have to modify the operation_stop_time in case that
        % it's empty or it's bigger
    	sc.operation_stop_time = convert_time(fli.arrival_time);
    end  
end