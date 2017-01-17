function [ air ] = create_airport()
    % Returns an empty Tairport struct
    Tairport = struct('id','','coordinates','','description','','runaway_cost',0,'free_parking_hours',0,'cost_parking_hours',0);
    air = Tairport; % Sets air to empty Tairport struct
end