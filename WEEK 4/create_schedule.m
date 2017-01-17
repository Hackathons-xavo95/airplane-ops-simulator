function [ sc ] = create_schedule()
    % Create Tflight struct
    Tflight = struct('type','','departure','','arrival','','departure_time','','arrival_time','','delay',0);
    % Create Tschedule struct
    Tschedule = struct('operation_start_time',0,'operation_stop_time',0,'flights',Tflight);
    sc = Tschedule; % Sets sc to empty Tschedule struct
end