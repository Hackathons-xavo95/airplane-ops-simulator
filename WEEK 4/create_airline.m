function [ A ] = create_airline( num_aircraft )
    % Returns a Tairline struct with the following fix data: the airline name is ‘JTG’
    % and the fleet is a vector of ‘num_aircraft’ empty Tschedule.
    % Create Tflight struct
    Tflight = struct('type','','departure','','arrival','','departure_time','','arrival_time','','delay',0);
    Tschedule = struct('operation_start_time',0,'operation_stop_time',0,'flights',Tflight); % Create Tschedule struct
    Tairline = struct('name','','fleet',Tschedule, 'total_costs',0); % Create Tairline struct
    A = Tairline; % Set A to empty Tairline struct
    A.name = 'JTG'; % Set the name
    n = 1;
    while(n<=num_aircraft) % Create empty Tschedule struct by num_aircraft
        A.fleet(n) = Tschedule;
        n = n + 1;
    end
end

