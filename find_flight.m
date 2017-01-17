function [ ind ] = find_flight( sc, dep_time )
    % Given a schedule sc, a time value with format HHMM indicating the current
    % departure time of a flight, dep_time, this function finds the index in the operations vector
    % of the departure time and returns it in ind. If the flight is not found then a -1 is returned.
    [~, rows] = size(sc.flights); % Compute the size of the schedule flights
    n = 1;
    encontrado = false;
    while(n<=rows && ~encontrado) % Do a search on schedule flights
        % Check if the departure time of current flight is the same as dep_time
        if(strcmp(sc.flights(n).departure_time, dep_time))
            encontrado = true;
        else
            n = n + 1;
        end
    end
    if encontrado
        ind = n; % If found return the index
    else
        ind = -1; % If not found return -1
    end
end

