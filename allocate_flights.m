function [ A ] = allocate_flights( VF )
    % Given a vector of flights allocate them to the fleet of the airline. Use the
    % previous function inside this one to create the initial structure with 10 aircraft. Then, for
    % each of the flights in VF test if it is compatible with any of the aircraft schedule of the
    % Tairline vector. When a compatible schedule is found, add the flight to the schedule. If it is
    % not compatible with any, then show a message to inform that more aircraft are needed in the
    % fleet to be able to do the allocation. In such case, return the Tairline struct with the
    % allocations done so far.
    A = create_airline(10); % Create initial structure with 10 elements
    n = 1;
    [~, rows] = size(VF); % Compute the size of the flights vector
    while(n<=rows) % Iterate on flights vector
        o = 1;
        [~, rows_A] = size(A.fleet); % Compute the size of the Airline fleet
        encontrado = false;
        while(o<=rows_A && ~encontrado) % Do a search for compatible flights
            if(check_schedule(A.fleet(o), VF(n))) % Check compatibility
                A.fleet(o) = add_schedule(A.fleet(o), VF(n)); % In case of compatible add to schedule
                encontrado = true; % Set encontrado = true to finish search
            else
                o = o + 1;
            end
        end
        n = n + 1;
    end
end

