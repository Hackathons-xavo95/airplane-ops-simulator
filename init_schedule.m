function [ sc ] = init_schedule( fli )
    % Given a Tflight struct with the information of a flight the funtion returns a
    % Tchedule struct using the information of that flight. Call the previous function inside this one
    % to create first an empty struct and then initialize it with the parameters.
    sc = create_schedule();
    sc.operation_start_time = convert_time(fli.departure_time);
    sc.operation_stop_time = convert_time(fli.arrival_time);
    sc.flights(1) = fli;
end

