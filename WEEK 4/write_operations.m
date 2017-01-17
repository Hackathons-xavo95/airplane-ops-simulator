function write_operations( A )
    % Given the airline data of A this function creates a new text file with the
    % operation of the day of the airline. Decide a format that can be easy to understand by a
    % human and also easy to read by a program.
    % Write the data with the following format
    % format: Airlane ----> Airlane.name/Airlane.fleets/Airlane.costs
    % format: Schedule ---> Schedule.operations_start_time;Schedule.operations_stop_time;Schedule.flights:
    % format: Flights ----> Flight.type-Flight.departure-Flight.arrival-Flight.departure_time-Flight.arrival_time-Flight.delay
    msg = string(A.name) + '/';
    n = 1;
    [~, rows] = size(A.fleet); % Cimpute the size of Airline fleet
    while(n<=rows)
        msg = msg + string(A.fleet(n).operation_start_time) + ';';
        msg = msg + string(A.fleet(n).operation_stop_time) + ';';
        o = 1;
        [~, rows_fli] = size(A.fleet(n).flights);
        while(o<=rows_fli)
            msg = msg + string(A.fleet(n).flights(o).type) + '-';
            msg = msg + string(A.fleet(n).flights(o).departure) + '-';
            msg = msg + string(A.fleet(n).flights(o).arrival) + '-';
            msg = msg + string(A.fleet(n).flights(o).departure_time) + '-';
            msg = msg + string(A.fleet(n).flights(o).arrival_time) + '-';
            if((o == rows_fli) && (n == rows))
                msg = msg + string(A.fleet(n).flights(o).delay) + '/';
            elseif(o == rows_fli)
                msg = msg + string(A.fleet(n).flights(o).delay) + ':';
            else
                msg = msg + string(A.fleet(n).flights(o).delay) + ' ';
            end
            o = o + 1;
        end
        n = n + 1;
    end
    msg = msg + string(A.total_costs);
    % The project guide says that you have to set filename to A.name, but
    % doing that replaces JTG Flights file
    [fileID, er] = fopen('Airline.txt', 'w'); % Open Airline.txt with write permissions
    if (fileID == -1) % Check if er opened the file correctly
        disp(er);
        return;
    end
    fwrite(fileID, msg); % Write and close
    fclose(fileID);
end

